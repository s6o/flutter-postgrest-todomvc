-- migrate:up

DROP ROLE IF EXISTS todo_user;
CREATE ROLE todo_user nologin;
GRANT todo_user TO authenticator;

GRANT USAGE ON SCHEMA api TO todo_user;
GRANT ALL ON api.todos TO todo_user;
GRANT USAGE, SELECT ON SEQUENCE api.todos_id_seq TO todo_user;

-- migrate:down

