import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AppError {
  String message;
  AppError(this.message);
}
