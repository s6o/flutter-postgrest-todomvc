-- migrate:up

-- Customized user specific todo list
-- the parameter is the response from /rpc/login aka (app_auth.login)
DROP FUNCTION IF EXISTS app_api.user_todos;
CREATE FUNCTION app_api.user_todos(user_login json)
RETURNS table(id INTEGER, task TEXT, due TEXT, done BOOLEAN, done_at TEXT) LANGUAGE sql AS $$
SELECT
  t.id
, t.task
, to_char(t.due, 'YYYY-MM-DD HH24:MI:SS.msZ') as due
, t.done
, to_char(t.done_at, 'YYYY-MM-DD HH24:MI:SS.msZ') as due_at
FROM (
  SELECT * FROM app_auth.verify(user_login->>'token', current_setting('app.jwt_secret'))
) AS verified
INNER JOIN app_api.todos t ON (verified.payload->>'uid')::int = t.user_id
  AND verified.valid = true;
$$ ;

-- migrate:down

DROP FUNCTION IF EXISTS app_api.user_todos;
