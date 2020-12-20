-- migrate:up

-- Customized user specific todo list
-- the parameter is the response from /rpc/login aka (app_auth.login)
DROP FUNCTION IF EXISTS app_api.user_todos;
CREATE FUNCTION app_api.user_todos(user_login json)
RETURNS table(id INTEGER, task TEXT, due TIMESTAMP, done BOOLEAN, done_at TIMESTAMP) LANGUAGE sql AS $$
SELECT
  t.id
, t.task
, t.due
, t.done
, t.done_at
FROM (
  SELECT * FROM app_auth.verify(user_login->>'token', current_setting('app.jwt_secret'))
) AS verified
INNER JOIN app_api.todos t ON (verified.payload->>'uid')::int = t.user_id
  AND verified.valid = true;
$$ ;

-- migrate:down

DROP FUNCTION IF EXISTS app_api.user_todos;
