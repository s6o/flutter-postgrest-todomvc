import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonProperty;

@jsonSerializable
class Todo {
  String task;
  DateTime due;
  bool done;

  @JsonProperty(ignoreIfNull: true)
  DateTime? doneAt;

  @JsonProperty(ignoreIfNull: true)
  int? id;

  Todo(
      {required this.task,
      DateTime? due,
      this.done = false,
      DateTime? doneAt,
      this.id})
      : due = due ?? dueDefault(),
        doneAt = done ? (doneAt ?? DateTime.now().toUtc()) : doneAt,
        super();

  Todo.fromMap(Map<String, dynamic> m)
      : task = m['task'],
        due = DateTime.tryParse(m['due']) ?? dueDefault(),
        done = m['done'] ?? false,
        doneAt = (m['done'] ?? false)
            ? m['done_at'] != null
                ? DateTime.tryParse(m['done_at'])
                : null
            : null,
        id = m['id'];

  static DateTime dueDefault() {
    return DateTime.now().toUtc().add(const Duration(days: 1));
  }
}

@jsonSerializable
class UserTodo extends Todo {
  String token;

  UserTodo(this.token, Todo t)
      : super(
            task: t.task, due: t.due, done: t.done, doneAt: t.doneAt, id: t.id);
}
