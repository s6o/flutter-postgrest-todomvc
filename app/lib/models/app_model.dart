import 'package:flutter/material.dart';
import 'package:todomvc/models/app_error.dart';
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/todo.dart';

enum TodoFilter {
  all,
  active,
  completed,
}

class AppModel extends ChangeNotifier {
  AppError _appError;
  Credentials _credentials;
  Jwt _jwt;
  List<Todo> _todos;
  Map<TodoFilter, bool> _filters;
  String _filterTitle;
  Todo newTodo;

  AppModel()
      : _appError = AppError.empty(),
        _credentials = Credentials(),
        _jwt = Jwt(''),
        _filters = {
          TodoFilter.all: true,
          TodoFilter.active: false,
          TodoFilter.completed: false,
        },
        _filterTitle = '',
        _todos = [],
        newTodo = Todo(task: '');

  AppError get appError {
    return _appError;
  }

  void setAppError(String message) {
    _appError = AppError(message);
    notifyListeners();
  }

  void appendTodo(Todo t) {
    newTodo = Todo(task: '');
    _todos.add(t);
    notifyListeners();
  }

  void deleteTodo(Todo t) {
    int index = _todos.indexWhere((Todo todo) => todo.id == t.id);
    _todos.removeAt(index);
    notifyListeners();
  }

  Credentials get credentials {
    return _credentials;
  }

  String get filterTitle {
    return _filterTitle;
  }

  bool hasFilter(TodoFilter tf) {
    return _filters[tf]!;
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
    return _jwt.token.isNotEmpty;
  }

  void setFilter(TodoFilter tf) {
    _filters = _filters.map((key, value) => MapEntry(key, false));
    _filters.update(tf, (_) => true);
    switch (tf) {
      case TodoFilter.active:
        _filterTitle = '(active)';
        break;
      case TodoFilter.completed:
        _filterTitle = '(completed)';
        break;
      case TodoFilter.all:
      default:
        _filterTitle = '';
    }
    notifyListeners();
  }

  List<Todo> get todos {
    TodoFilter filter = _filters.keys
        .fold(TodoFilter.all, (f, TodoFilter tf) => _filters[tf]! ? tf : f);
    switch (filter) {
      case TodoFilter.active:
        return _todos.where((Todo t) => t.done == false).toList();
      case TodoFilter.completed:
        return _todos.where((Todo t) => t.done == true).toList();
      case TodoFilter.all:
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
    _jwt = Jwt('');
    notifyListeners();
  }

  void updateTodo(Todo t) {
    int index = _todos.indexWhere((Todo todo) => todo.id == t.id);
    _todos[index] = t;
    notifyListeners();
  }
}
