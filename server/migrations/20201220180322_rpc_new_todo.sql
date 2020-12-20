-- migrate:up

-- New user specific TODO entry
-- the parameter is the response from /rpc/login aka (app_auth.login) with
-- additional fields:
-- {token: <string>, task: <string>, due: <string>}
DROP FUNCTION IF EXISTS app_api.user_new_todo;

CREATE FUNCTION app_api.user_new_todo(user_todo json)
RETURNS table(id INTEGER, task TEXT, due TIMESTAMP, done BOOLEAN, done_at TIMESTAMP) LANGUAGE sql AS $$
INSERT INTO app_api.todos (user_id, task, due)
  SELECT
    (verified.payload->>'uid')::int
  , (user_todo->>'task')::text
  , coalesce((user_todo->>'due')::timestamp, current_timestamp + '1 day'::interval)
  FROM (
    SELECT * FROM app_auth.verify(user_todo->>'token', current_setting('app.jwt_secret'))
  ) AS verified
  WHERE verified.valid = true
  RETURNING id, task, due, done, done_at;
$$ ;


-- migrate:down

DROP FUNCTION IF EXISTS app_api.user_new_todo;