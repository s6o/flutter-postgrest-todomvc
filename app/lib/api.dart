import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/error.dart';
import 'package:todomvc/models/todo.dart';
import 'package:todomvc/serializer.dart';

class Api {
  static bool _isApp = false;
  static String _baseUrlApp = 'https://332243c48c25.ngrok.io';
  static String _baseUrlWeb = 'http://localhost:3000';
  static String _baseUrl = _isApp ? _baseUrlApp : _baseUrlWeb;

  static Future<Todo> deleteTodo(Jwt jwt, Todo t) {
    return http.delete(
      '$_baseUrl/todos?id=eq.${t.id}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${jwt.token}',
      },
    ).then((http.Response r) =>
        r.statusCode == 204 ? t : Future.error(fromJson<Error>(r.body)));
  }

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

  static Future<Todo> newTodo(Jwt jwt, Todo t) {
    if (jwt.token == null || jwt.token.isEmpty) {
      return Future.error(Error().message = 'New Todo requires token.');
    }
    return http
        .post(
          '$_baseUrl/rpc/user_new_todo',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${jwt.token}',
            'Prefer': 'params=single-object',
            'Accept': 'application/vnd.pgrst.object+json'
          },
          body: toJson<UserTodo>(UserTodo(jwt.token, t)),
        )
        .then((http.Response r) => r.statusCode == 200
            ? fromJson<Todo>(r.body)
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
        .then((http.Response r) {
      if (r.statusCode == 200) {
        if (kIsWeb) {
          List<dynamic> tmaps = jsonDecode(r.body);
          return tmaps.map((m) => Todo.fromMap(m)).toList();
        } else {
          return fromJson<List<Todo>>(r.body);
        }
      } else {
        return Future.error(fromJson<Error>(r.body));
      }
    });
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

  static Future<Todo> updateTodo(Jwt jwt, Todo t) {
    if (jwt.token == null || jwt.token.isEmpty) {
      return Future.error(Error().message = 'Todo update requires token.');
    }
    return http
        .patch('$_baseUrl/todos?id=eq.${t.id}',
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${jwt.token}',
            },
            body: toJson<Todo>(t))
        .then((http.Response r) =>
            r.statusCode == 204 ? t : Future.error(fromJson<Error>(r.body)));
  }
}
