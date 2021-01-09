import 'package:flutter/foundation.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonProperty;

@jsonSerializable
class Todo {
  @JsonProperty(ignoreIfNull: true)
  int id;

  String task;
  DateTime due;
  bool done;
  DateTime doneAt;

  Todo({@required this.task, due, this.done = false, this.id, doneAt})
      : this.due = due ?? dueDefault(),
        this.doneAt = done ? DateTime.now().toUtc() : null,
        super();

  Todo.fromMap(Map<String, dynamic> m)
      : id = m['id'] ?? null,
        task = m['task'],
        due = DateTime.tryParse(m['due']),
        done = m['done'] ?? false,
        doneAt = m['done_at'] == null ? null : DateTime.tryParse(m['done_at']);

  static DateTime dueDefault() {
    return DateTime.now().toUtc().add(Duration(days: 1));
  }
}

@jsonSerializable
class UserTodo extends Todo {
  String token;

  UserTodo(this.token, Todo t)
      : super(
            task: t.task, due: t.due, done: t.done, id: t.id, doneAt: t.doneAt);
}
