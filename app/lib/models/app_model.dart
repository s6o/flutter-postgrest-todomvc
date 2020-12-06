import 'package:flutter/material.dart';
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/todo.dart';

class AppModel extends ChangeNotifier {
  Credentials _credentials;
  Jwt _jwt;
  List<Todo> todos;

  AppModel()
      : _credentials = Credentials(),
        _jwt = null,
        todos = [];

  Credentials get credentials {
    return _credentials;
  }

  get jwt {
    return _jwt;
  }

  set jwt(Jwt jwt) {
    _jwt = jwt;
    _credentials = Credentials();
    notifyListeners();
  }

  bool get isAuthorized {
    return _jwt != null && _jwt.token.isNotEmpty;
  }

  void toggle(int index) {
    todos[index].done = !todos[index].done;
    notifyListeners();
  }

  void unAuthorize() {
    _jwt = null;
    notifyListeners();
  }
}
