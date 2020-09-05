-- migrate:up

CREATE SCHEMA IF NOT EXISTS app_auth;


CREATE TABLE app_auth.users (
  uid SERIAL PRIMARY KEY
, email TEXT UNIQUE CHECK (email ~* '^.+@.+\..+$')
, pass TEXT NOT NULL CHECK (length(pass) < 512)
, role NAME NOT NULL DEFAULT 'appuser' CHECK (length(role) < 512)
, first_name TEXT
, last_name TEXT
);


CREATE OR REPLACE FUNCTION
app_auth.check_role_exists() RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles AS r WHERE r.rolname = new.role) THEN
        RAISE foreign_key_violation USING message =
            'unknown database role: ' || new.role;
        RETURN NULL;
    END IF;
    RETURN NEW;
END
$$;

DROP TRIGGER IF EXISTS ensure_user_role_exists ON app_auth.users;
CREATE CONSTRAINT TRIGGER ensure_user_role_exists
    AFTER INSERT OR UPDATE ON app_auth.users
    FOR EACH ROW
    EXECUTE PROCEDURE app_auth.check_role_exists();


CREATE OR REPLACE FUNCTION
app_auth.encrypt_pass() RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' OR NEW.pass <> OLD.pass THEN
        NEW.pass = crypt(NEW.pass, gen_salt('bf'));
    END IF;
    RETURN NEW;
end
$$;

DROP TRIGGER IF EXISTS ENCRYPT_PASS ON app_auth.users;
CREATE TRIGGER ENCRYPT_PASS
    BEFORE INSERT OR UPDATE ON app_auth.users
    FOR EACH ROW
    EXECUTE PROCEDURE app_auth.encrypt_pass();


CREATE TYPE app_auth.jwt_token AS (
  token TEXT
);


CREATE OR REPLACE FUNCTION
app_auth.user_role(email TEXT, pass TEXT) RETURNS NAME
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN (
        SELECT role FROM app_auth.users
            WHERE users.email = user_role.email AND users.pass = crypt(user_role.pass, users.pass)
    );
END;
$$;


CREATE OR REPLACE FUNCTION
app_auth.login(email TEXT, pass TEXT) RETURNS app_auth.jwt_token
    LANGUAGE plpgsql
    AS $$
DECLARE
    _role NAME;
    result app_auth.jwt_token;
BEGIN
    -- check email and password
    SELECT app_auth.user_role(email, pass) INTO _role;
    IF _role IS NULL THEN
        RAISE invalid_password USING message = 'invalid user or password';
    END IF;

    SELECT pgjwt.sign(row_to_json(r), current_setting('app.jwt_secret')) AS token
    FROM (
        SELECT
          _role AS role,
          au.email,
          au.uid,
          extract(epoch from now())::integer + 60*60 AS exp
        FROM app_auth.users au
        WHERE au.email = login.email
    ) r
    INTO result;

    RETURN result;
END;
$$;


DROP ROLE IF EXISTS authenticator;
DROP ROLE IF EXISTS anon;
DROP ROLE IF EXISTS appuser;

CREATE ROLE anon;
CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'todo-auth';

CREATE ROLE appuser NOLOGIN;
GRANT appuser TO authenticator;

GRANT USAGE ON SCHEMA app_auth TO anon;
GRANT SELECT ON TABLE pg_authid, app_auth.users TO anon;
GRANT EXECUTE ON FUNCTION app_auth.login(text, text) TO anon;


-- migrate:down

