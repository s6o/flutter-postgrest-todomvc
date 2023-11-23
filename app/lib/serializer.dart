import 'package:dart_json_mapper/dart_json_mapper.dart';

String toJson<T>(T t) {
  return JsonMapper.serialize(
      t, const SerializationOptions(caseStyle: CaseStyle.snake));
}

T? fromJson<T>(String json) {
  return JsonMapper.deserialize<T>(
      json, const DeserializationOptions(caseStyle: CaseStyle.camel));
}
