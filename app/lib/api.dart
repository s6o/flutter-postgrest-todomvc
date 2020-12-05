import 'package:http/http.dart' as http;
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/error.dart';
import 'package:todomvc/serializer.dart';

class Api {
  static Future<Jwt> login(Credentials credentials) {
    return http
        .post(
          'http://localhost:3000/rpc/login',
          headers: {
            'Content-Type': 'application/json',
            'Content-Profile': 'app_auth',
            'Accept': 'application/vnd.pgrst.object+json'
          },
          body: toJson<Credentials>(credentials),
        )
        .then((http.Response r) => r.statusCode == 200
            ? fromJson<Jwt>(r.body)
            : Future.error(fromJson<Error>(r.body)));
  }
}
