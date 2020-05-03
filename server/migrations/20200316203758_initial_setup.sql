-- migrate:up

--
-- http://postgrest.org/en/v7.0.0/tutorials/tut0.html
--
CREATE SCHEMA api;

CREATE TABLE api.todos (
  id SERIAL PRIMARY KEY
, done BOOLEAN NOT NULL DEFAULT false
, task TEXT NOT NULL
, due TIMESTAMPTZ
);

INSERT INTO api.todos (task) VALUES
  ('finish tutorial 0')
, ('pat self on back');

DROP ROLE IF EXISTS web_anon;
CREATE ROLE web_anon nologin;

GRANT USAGE ON SCHEMA api TO web_anon;
GRANT SELECT ON api.todos TO web_anon;

DROP ROLE IF EXISTS authenticator;
CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'todo-auth';
GRANT web_anon TO authenticator;

-- migrate:down

