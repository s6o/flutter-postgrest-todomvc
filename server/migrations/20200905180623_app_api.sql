-- migrate:up

CREATE SCHEMA IF NOT EXISTS app_api;

CREATE TABLE IF NOT EXISTS app_api.todos (
  id SERIAL PRIMARY KEY
, user_id INTEGER REFERENCES app_auth.users(uid) ON DELETE CASCADE ON UPDATE CASCADE
, task TEXT NOT NULL
, due TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() at time zone 'utc') + '1 day'::interval
, done BOOLEAN NOT NULL DEFAULT false
, done_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE FUNCTION done_at_fill() RETURNS trigger AS $$
BEGIN
  IF NEW.done = true AND NEW.done_at IS NULL THEN
    NEW.done_at := (now() at time zone 'utc');
  END IF;

  IF NEW.done = false THEN
    NEW.done_at := NULL;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER done_at_fill BEFORE INSERT OR UPDATE ON app_api.todos
    FOR EACH ROW EXECUTE PROCEDURE done_at_fill();


GRANT ALL ON SCHEMA app_api TO appuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA app_api TO appuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA app_api TO appuser;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA app_api TO appuser;

GRANT USAGE ON SCHEMA app_auth TO appuser;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA app_auth TO appuser;

-- migrate:down

