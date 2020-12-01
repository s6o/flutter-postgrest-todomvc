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

  Todo({@required this.task, due, this.done = false, this.id})
      : this.due = due ?? dueDefault(),
        super();

  static DateTime dueDefault() {
    return DateTime.now().toUtc().add(Duration(days: 1));
  }
}
