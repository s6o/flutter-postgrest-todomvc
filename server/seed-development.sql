INSERT INTO app_auth.users
  (email, pass, first_name, last_name)
VALUES
  ('john.doe@lost.net', 'johnny88', 'John', 'Doe')
, ('jane.doe@lost.net', 'jenny678', 'Jane', 'Doe')
ON CONFLICT DO NOTHING
;

INSERT INTO app_api.todos (user_id, task) VALUES
  (1, 'Start training tomorrow')
, (1, 'Buy some milk')
, (2, 'Start training tomorrow')
ON CONFLICT DO NOTHING
;