import 'package:flutter/material.dart';
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/todo.dart';

enum TodoFilter {
  All,
  Active,
  Completed,
}

class AppModel extends ChangeNotifier {
  Credentials _credentials;
  Jwt _jwt;
  List<Todo> _todos;
  Map<TodoFilter, bool> _filters;
  String _filterTitle;
  Todo newTodo;

  AppModel()
      : _credentials = Credentials(),
        _jwt = null,
        _filters = {
          TodoFilter.All: true,
          TodoFilter.Active: false,
          TodoFilter.Completed: false,
        },
        _filterTitle = '',
        _todos = [],
        newTodo = Todo(task: 'A new todo');

  void appendTodo(Todo t) {
    newTodo = Todo(task: 'A new todo.');
    _todos.add(t);
    notifyListeners();
  }

  Credentials get credentials {
    return _credentials;
  }

  String get filterTitle {
    return _filterTitle;
  }

  bool hasFilter(TodoFilter tf) {
    return _filters[tf];
  }

  Jwt get jwt {
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

  void setFilter(TodoFilter tf) {
    _filters = _filters.map((key, value) => MapEntry(key, false));
    _filters.update(tf, (_) => true);
    switch (tf) {
      case TodoFilter.Active:
        _filterTitle = '(active)';
        break;
      case TodoFilter.Completed:
        _filterTitle = '(completed)';
        break;
      case TodoFilter.All:
      default:
        _filterTitle = '';
    }
    notifyListeners();
  }

  List<Todo> get todos {
    TodoFilter filter = _filters.keys
        .fold(TodoFilter.All, (f, TodoFilter tf) => _filters[tf] ? tf : f);
    switch (filter) {
      case TodoFilter.Active:
        return _todos.where((Todo t) => t.done == false).toList();
      case TodoFilter.Completed:
        return _todos.where((Todo t) => t.done == true).toList();
      case TodoFilter.All:
      default:
        return _todos;
    }
  }

  set todos(List<Todo> todos) {
    _todos = todos;
  }

  void toggle(int index) {
    _todos[index].done = !_todos[index].done;
    notifyListeners();
  }

  void unAuthorize() {
    _jwt = null;
    notifyListeners();
  }
}
