import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AppError {
  final String message;

  AppError(this.message) {
    assert(this.message != null && this.message.trim().length > 0);
  }
  AppError.empty() : message = '';

  bool get isEmpty {
    return message.isEmpty;
  }
}
