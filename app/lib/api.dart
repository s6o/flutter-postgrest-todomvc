import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/app_error.dart';
import 'package:todomvc/models/todo.dart';
import 'package:todomvc/serializer.dart';

class Api {
  static bool _isApp = false;
  static Uri _baseUrlApp = Uri(scheme: 'https', host: '332243c48c25.ngrok.io');
  static Uri _baseUrlWeb = Uri(scheme: 'http', host: 'localhost', port: 3000);
  static Uri _baseUrl = _isApp ? _baseUrlApp : _baseUrlWeb;

  static Future<Todo> deleteTodo(Jwt jwt, Todo t) async {
    try {
      http.Response r = await http.delete(
        _baseUrl.replace(path: 'todos', query: 'id=eq.${t.id}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${jwt.token}',
        },
      );
      return r.statusCode == 204 ? t : Future.error(fromJson<AppError>(r.body));
    } catch (e) {
      return Future.error(AppError(e.toString()));
    }
  }

  static Future<Jwt> login(Credentials credentials) async {
    try {
      http.Response r = await http.post(
        _baseUrl.replace(path: 'rpc/login'),
        headers: {
          'Content-Type': 'application/json',
          'Content-Profile': 'app_auth',
          'Accept': 'application/vnd.pgrst.object+json'
        },
        body: toJson<Credentials>(credentials),
      );
      return r.statusCode == 200
          ? fromJson<Jwt>(r.body)
          : Future.error(fromJson<AppError>(r.body));
    } catch (e) {
      return Future.error(AppError(e.toString()));
    }
  }

  static Future<Todo> newTodo(Jwt jwt, Todo t) async {
    try {
      if (jwt.token == null || jwt.token.isEmpty) {
        return Future.error(AppError('New Todo requires token.'));
      }
      http.Response r = await http.post(
        _baseUrl.replace(path: 'rpc/user_new_todo'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${jwt.token}',
          'Prefer': 'params=single-object',
          'Accept': 'application/vnd.pgrst.object+json'
        },
        body: toJson<UserTodo>(UserTodo(jwt.token, t)),
      );
      return r.statusCode == 200
          ? kIsWeb
              ? Todo.fromMap(jsonDecode(r.body))
              : fromJson<Todo>(r.body)
          : Future.error(fromJson<AppError>(r.body));
    } catch (e) {
      return Future.error(AppError(e.toString()));
    }
  }

  static Future<List<Todo>> todos(Jwt jwt) async {
    try {
      http.Response r = await http.post(
        _baseUrl.replace(path: 'rpc/user_todos'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${jwt.token}',
          'Prefer': 'params=single-object'
        },
        body: toJson<Jwt>(jwt),
      );
      if (r.statusCode == 200) {
        if (kIsWeb) {
          List<dynamic> tmaps = jsonDecode(r.body);
          return tmaps.map((m) => Todo.fromMap(m)).toList();
        } else {
          return fromJson<List<Todo>>(r.body);
        }
      } else {
        return Future.error(fromJson<AppError>(r.body));
      }
    } catch (e) {
      return Future.error(AppError(e.toString()));
    }
  }

  static Future<bool> toggle(Jwt jwt, Todo t) async {
    try {
      http.Response r = await http.patch(
          _baseUrl.replace(path: 'todos', query: 'id=eq.${t.id}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${jwt.token}',
          },
          body: '\{"done":${!t.done}\}');
      return r.statusCode == 204 ? true : false;
    } catch (e) {
      return Future.error(AppError(e.toString()));
    }
  }

  static Future<Todo> updateTodo(Jwt jwt, Todo t) async {
    try {
      if (jwt.token == null || jwt.token.isEmpty) {
        return Future.error(AppError('Todo update requires token.'));
      }
      http.Response r = await http.patch(
          _baseUrl.replace(path: 'todos', query: 'id=eq.${t.id}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${jwt.token}',
          },
          body: toJson<Todo>(t));
      return r.statusCode == 204 ? t : Future.error(fromJson<AppError>(r.body));
    } catch (e) {
      return Future.error(AppError(e.toString()));
    }
  }
}
