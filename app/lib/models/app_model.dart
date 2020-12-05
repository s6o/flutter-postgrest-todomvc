import 'package:flutter/material.dart';
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/todo.dart';

class AppModel extends ChangeNotifier {
  Credentials _credentials;
  Jwt _jwt;
  List<Todo> _todos;

  AppModel()
      : _credentials = Credentials(),
        _jwt = null,
        _todos = [];

  Credentials get credentials {
    return _credentials;
  }

  set jwt(Jwt jwt) {
    _jwt = jwt;
    _credentials = Credentials();
    notifyListeners();
  }

  bool get isAuthorized {
    return _jwt != null && _jwt.token.isNotEmpty;
  }

  void unAuthorize() {
    _jwt = null;
    notifyListeners();
  }
}
