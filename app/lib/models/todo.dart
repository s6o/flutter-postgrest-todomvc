import 'package:flutter/foundation.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonProperty;

@jsonSerializable
class Todo {
  String task;
  DateTime due;
  bool done;
  DateTime doneAt;

  @JsonProperty(ignoreIfNull: true)
  int id;

  Todo({@required this.task, due, this.done = false, doneAt, this.id})
      : this.due = due ?? dueDefault(),
        this.doneAt = done ? (doneAt ?? DateTime.now().toUtc()) : doneAt,
        super();

  Todo.fromMap(Map<String, dynamic> m)
      : task = m['task'],
        due = DateTime.tryParse(m['due']),
        done = m['done'] ?? false,
        doneAt = (m['done'] ?? false)
            ? m['done_at'] != null
                ? DateTime.tryParse(m['done_at']) ?? DateTime.now().toUtc()
                : DateTime.now().toUtc()
            : m['done_at'] != null
                ? DateTime.tryParse(m['done_at'])
                : null,
        id = m['id'] ?? null;

  static DateTime dueDefault() {
    return DateTime.now().toUtc().add(Duration(days: 1));
  }
}

@jsonSerializable
class UserTodo extends Todo {
  String token;

  UserTodo(this.token, Todo t)
      : super(
            task: t.task, due: t.due, done: t.done, doneAt: t.doneAt, id: t.id);
}
