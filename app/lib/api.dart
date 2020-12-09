import 'package:http/http.dart' as http;
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/error.dart';
import 'package:todomvc/models/todo.dart';
import 'package:todomvc/serializer.dart';

class Api {
  static bool _isApp = true;
  static String _baseUrlApp = 'https://466f6471e5cc.ngrok.io';
  static String _baseUrlWeb = 'http://localhost:3000';
  static String _baseUrl = _isApp ? _baseUrlApp : _baseUrlWeb;

  static Future<Jwt> login(Credentials credentials) {
    return http
        .post(
          '$_baseUrl/rpc/login',
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

  static Future<List<Todo>> todos(Jwt jwt) {
    return http
        .post(
          '$_baseUrl/rpc/user_todos',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${jwt.token}',
            'Prefer': 'params=single-object'
          },
          body: toJson<Jwt>(jwt),
        )
        .then((http.Response r) => r.statusCode == 200
            ? fromJson<List<Todo>>(r.body)
            : Future.error(fromJson<Error>(r.body)));
  }

  static Future<bool> toggle(Jwt jwt, Todo t) {
    return http
        .patch('$_baseUrl/todos?id=eq.${t.id}',
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${jwt.token}',
            },
            body: '\{"done":${!t.done}\}')
        .then((http.Response r) => r.statusCode == 204 ? true : false);
  }
}
