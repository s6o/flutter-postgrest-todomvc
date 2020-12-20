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

  @JsonProperty(ignoreIfNull: true)
  String token;

  Todo(
      {@required this.task,
      due,
      this.done = false,
      this.token,
      this.id,
      doneAt})
      : this.due = due ?? dueDefault(),
        this.doneAt = done ? DateTime.now().toUtc() : null,
        super();

  static DateTime dueDefault() {
    return DateTime.now().toUtc().add(Duration(days: 1));
  }
}
