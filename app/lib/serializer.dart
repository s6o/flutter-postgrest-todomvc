import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:todomvc/models/todo.dart';

String toJson(Todo t) {
  return JsonMapper.serialize(
      t, SerializationOptions(caseStyle: CaseStyle.Snake));
}

Todo fromJson(String json) {
  return JsonMapper.deserialize<Todo>(
      json, DeserializationOptions(caseStyle: CaseStyle.Camel));
}
