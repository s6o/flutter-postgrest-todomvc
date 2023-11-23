import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AppError {
  final String message;

  AppError(String? message) : message = message ?? '';
  AppError.empty() : message = '';

  bool get isEmpty => message.isEmpty;
}
