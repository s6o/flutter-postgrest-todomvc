-- migrate:up

--
-- http://postgrest.org/en/v6.0/tutorials/tut0.html
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

CREATE ROLE web_anon nologin;

GRANT USAGE ON SCHEMA api TO web_anon;
GRANT SELECT ON api.todos TO web_anon;

CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'todo-auth';
GRANT web_anon TO authenticator;

-- migrate:down

