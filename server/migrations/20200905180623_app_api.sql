-- migrate:up

CREATE SCHEMA IF NOT EXISTS app_api;

CREATE TABLE app_api.todos (
  id SERIAL PRIMARY KEY
, user_id INTEGER REFERENCES app_auth.users(uid) ON DELETE CASCADE ON UPDATE CASCADE
, task TEXT NOT NULL
, due TIMESTAMPTZ DEFAULT current_timestamp + '1 day'::interval
, done BOOLEAN NOT NULL DEFAULT false
);


GRANT ALL ON SCHEMA app_api TO appuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA app_api TO appuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA app_api TO appuser;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA app_api TO appuser;


-- migrate:down

