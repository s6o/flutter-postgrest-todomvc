import 'package:flutter_test/flutter_test.dart';
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/todo.dart';

import 'package:todomvc/serializer.dart';
import 'serializer_test.mapper.g.dart' show initializeJsonMapper;

void main() {
  initializeJsonMapper();

  group('Jwt serialization/deserialization', () {
    final jwt = Jwt(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYXBwdXNlciIsImVtYWlsIjoiam9obi5kb2VAbG9zdC5uZXQiLCJ1aWQiOjEsImV4cCI6MTYwNzI1MTE2MH0.-87h32BxcaC0N8MhFA2fpPJYpZsEkr2oybgrQGVha6I');
    final jwtJson =
        '{"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYXBwdXNlciIsImVtYWlsIjoiam9obi5kb2VAbG9zdC5uZXQiLCJ1aWQiOjEsImV4cCI6MTYwNzI1MTE2MH0.-87h32BxcaC0N8MhFA2fpPJYpZsEkr2oybgrQGVha6I"}';

    setUp(() {});

    test('- to JSON', () {
      final json = toJson<Jwt>(jwt);
      expect(
          json,
          equals(
              '{"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYXBwdXNlciIsImVtYWlsIjoiam9obi5kb2VAbG9zdC5uZXQiLCJ1aWQiOjEsImV4cCI6MTYwNzI1MTE2MH0.-87h32BxcaC0N8MhFA2fpPJYpZsEkr2oybgrQGVha6I"}'));
    });

    test('- from JSON', () {
      final j = fromJson<Jwt>(jwtJson);
      expect(
          j.token,
          equals(
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYXBwdXNlciIsImVtYWlsIjoiam9obi5kb2VAbG9zdC5uZXQiLCJ1aWQiOjEsImV4cCI6MTYwNzI1MTE2MH0.-87h32BxcaC0N8MhFA2fpPJYpZsEkr2oybgrQGVha6I'));
    });
  });

  group('Todo serialization/deserialization', () {
    final defaultDeadline = Todo.dueDefault();
    final defaultTodo = Todo(task: 'Buy milk', due: defaultDeadline);
    final dbTodoJson =
        '{"id": 1,"task": "Buy milk","due": "2020-11-30 21:02:33.045Z","done": true}';

    setUp(() {});

    test('- to JSON', () {
      final json = toJson<Todo>(defaultTodo);
      expect(
          json,
          equals(
              '{"task":"Buy milk","due":"${defaultDeadline.toString()}","done":false}'));
    });

    test('- from JSON', () {
      final t = fromJson<Todo>(dbTodoJson);
      expect(t.id, equals(1));
      expect(t.task, equals("Buy milk"));
      expect(t.done, equals(true));
      expect(t.due, isInstanceOf<DateTime>());
      expect(t.due.toString(), equals("2020-11-30 21:02:33.045Z"));
    });
  });
}
