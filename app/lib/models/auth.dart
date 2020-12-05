import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;

@jsonSerializable
class Jwt {
  final String token;
  Jwt(this.token);
}

@jsonSerializable
class Credentials {
  String email;
  String pass;
  Credentials()
      : email = '',
        pass = '';
}
