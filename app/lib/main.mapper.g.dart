// This file has been generated by the dart_json_mapper package.
// https://github.com/k-paxian/dart-json-mapper
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper, JsonMapperAdapter, typeOf;
import 'package:todomvc/models/auth.dart' show Jwt, Credentials;
import 'package:todomvc/models/error.dart' show Error;
import 'package:todomvc/models/todo.dart' show Todo;

// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:dart_json_mapper/src/model/annotations.dart' as prefix0;
import 'package:meta/meta.dart' as prefix4;
import 'package:todomvc/models/auth.dart' as prefix1;
import 'package:todomvc/models/error.dart' as prefix2;
import 'package:todomvc/models/todo.dart' as prefix3;

// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: implementation_imports

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{const prefix0.JsonSerializable(): r.ReflectorData(<m.TypeMirror>[r.NonGenericClassMirrorImpl(r'Jwt', r'.Jwt', 7, 0, const prefix0.JsonSerializable(), const <int>[0, 9], const <int>[10, 11, 12, 13, 14, 8], const <int>[], -1, {}, {}, {r'': (b) => (token) => b ? prefix1.Jwt(token) : null}, -1, 0, const <int>[], const [prefix0.jsonSerializable], null), r.NonGenericClassMirrorImpl(r'Credentials', r'.Credentials', 7, 1, const prefix0.JsonSerializable(), const <int>[1, 2, 19], const <int>[10, 11, 12, 13, 14, 15, 16, 17, 18], const <int>[], -1, {}, {}, {r'': (b) => () => b ? prefix1.Credentials() : null}, -1, 1, const <int>[], const [prefix0.jsonSerializable], null), r.NonGenericClassMirrorImpl(r'Error', r'.Error', 7, 2, const prefix0.JsonSerializable(), const <int>[3, 22], const <int>[10, 11, 12, 13, 14, 20, 21], const <int>[], -1, {}, {}, {r'': (b) => () => b ? prefix2.Error() : null}, -1, 2, const <int>[], const [prefix0.jsonSerializable], null), r.NonGenericClassMirrorImpl(r'Todo', r'.Todo', 7, 3, const prefix0.JsonSerializable(), const <int>[4, 5, 6, 7, 31], const <int>[10, 11, 12, 13, 14, 23, 24, 25, 26, 27, 28, 29, 30], const <int>[], -1, {}, {}, {r'': (b) => ({task, due, done = false, id}) => b ? prefix3.Todo(done: done, due: due, id: id, task: task) : null}, -1, 3, const <int>[], const [prefix0.jsonSerializable], null)], <m.DeclarationMirror>[r.VariableMirrorImpl(r'token', 33797, 0, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'email', 32773, 1, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'pass', 32773, 1, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'message', 32773, 2, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'id', 32773, 3, const prefix0.JsonSerializable(), -1, 5, 5, const <int>[], const [const prefix0.JsonProperty(ignoreIfNull: true)]), r.VariableMirrorImpl(r'task', 32773, 3, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const []), r.VariableMirrorImpl(r'due', 32773, 3, const prefix0.JsonSerializable(), -1, 6, 6, const <int>[], const []), r.VariableMirrorImpl(r'done', 32773, 3, const prefix0.JsonSerializable(), -1, 7, 7, const <int>[], const []), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 0, 8), r.MethodMirrorImpl(r'', 0, 0, -1, 0, 0, const <int>[], const <int>[0], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'==', 131074, null, -1, 7, 7, const <int>[], const <int>[1], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'toString', 131074, null, -1, 4, 4, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'noSuchMethod', 65538, null, null, null, null, const <int>[], const <int>[2], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 5, 5, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.MethodMirrorImpl(r'runtimeType', 131075, null, -1, 8, 8, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 1, 15), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 1, 16), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 2, 17), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 2, 18), r.MethodMirrorImpl(r'', 0, 1, -1, 1, 1, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 3, 20), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 3, 21), r.MethodMirrorImpl(r'', 64, 2, -1, 2, 2, const <int>[], const <int>[], const prefix0.JsonSerializable(), const []), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 4, 23), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 4, 24), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 5, 25), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 5, 26), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 6, 27), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 6, 28), r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 7, 29), r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 7, 30), r.MethodMirrorImpl(r'', 0, 3, -1, 3, 3, const <int>[], const <int>[6, 7, 8, 9], const prefix0.JsonSerializable(), const [])], <m.ParameterMirror>[r.ParameterMirrorImpl(r'token', 32774, 9, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'other', 32774, 10, const prefix0.JsonSerializable(), -1, 9, 9, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'invocation', 32774, 12, const prefix0.JsonSerializable(), -1, 10, 10, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_email', 32870, 16, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_pass', 32870, 18, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_message', 32870, 21, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'task', 45062, 31, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [prefix4.required], null, #task), r.ParameterMirrorImpl(r'due', 28678, 31, const prefix0.JsonSerializable(), null, null, null, const <int>[], const [], null, #due), r.ParameterMirrorImpl(r'done', 47110, 31, const prefix0.JsonSerializable(), -1, 7, 7, const <int>[], const [], false, #done), r.ParameterMirrorImpl(r'id', 45062, 31, const prefix0.JsonSerializable(), -1, 5, 5, const <int>[], const [], null, #id), r.ParameterMirrorImpl(r'_id', 32870, 24, const prefix0.JsonSerializable(), -1, 5, 5, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_task', 32870, 26, const prefix0.JsonSerializable(), -1, 4, 4, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_due', 32870, 28, const prefix0.JsonSerializable(), -1, 6, 6, const <int>[], const [], null, null), r.ParameterMirrorImpl(r'_done', 32870, 30, const prefix0.JsonSerializable(), -1, 7, 7, const <int>[], const [], null, null)], <Type>[prefix1.Jwt, prefix1.Credentials, prefix2.Error, prefix3.Todo, String, int, DateTime, bool, Type, Object, Invocation], 4, {r'==': (dynamic instance) => (x) => instance == x, r'toString': (dynamic instance) => instance.toString, r'noSuchMethod': (dynamic instance) => instance.noSuchMethod, r'hashCode': (dynamic instance) => instance.hashCode, r'runtimeType': (dynamic instance) => instance.runtimeType, r'token': (dynamic instance) => instance.token, r'email': (dynamic instance) => instance.email, r'pass': (dynamic instance) => instance.pass, r'message': (dynamic instance) => instance.message, r'id': (dynamic instance) => instance.id, r'task': (dynamic instance) => instance.task, r'due': (dynamic instance) => instance.due, r'done': (dynamic instance) => instance.done}, {r'email=': (dynamic instance, value) => instance.email = value, r'pass=': (dynamic instance, value) => instance.pass = value, r'message=': (dynamic instance, value) => instance.message = value, r'id=': (dynamic instance, value) => instance.id = value, r'task=': (dynamic instance, value) => instance.task = value, r'due=': (dynamic instance, value) => instance.due = value, r'done=': (dynamic instance, value) => instance.done = value}, null, [])};


final _memberSymbolMap = null;

void _initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}

final mainAdapter = JsonMapperAdapter(
  title: 'mainAdapter',
  url: 'package:todomvc/main.dart',
  valueDecorators: {
    typeOf<List<Jwt>>(): (value) => value.cast<Jwt>(),
    typeOf<Set<Jwt>>(): (value) => value.cast<Jwt>(),
    typeOf<List<Credentials>>(): (value) => value.cast<Credentials>(),
    typeOf<Set<Credentials>>(): (value) => value.cast<Credentials>(),
    typeOf<List<Todo>>(): (value) => value.cast<Todo>(),
    typeOf<Set<Todo>>(): (value) => value.cast<Todo>(),
    typeOf<List<Error>>(): (value) => value.cast<Error>(),
    typeOf<Set<Error>>(): (value) => value.cast<Error>()
},
  enumValues: {

});

JsonMapper initializeJsonMapper({Iterable<JsonMapperAdapter> adapters = const []}) {
  _initializeReflectable();
  [...adapters, mainAdapter].forEach((x) => JsonMapper().useAdapter(x));
  return JsonMapper();
}