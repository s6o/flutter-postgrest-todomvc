import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Error {
  String message;
  Error(this.message);
}
