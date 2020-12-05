import 'package:dart_json_mapper/dart_json_mapper.dart';

String toJson<T>(T t) {
  return JsonMapper.serialize(
      t, SerializationOptions(caseStyle: CaseStyle.Snake));
}

T fromJson<T>(String json) {
  return JsonMapper.deserialize<T>(
      json, DeserializationOptions(caseStyle: CaseStyle.Camel));
}
