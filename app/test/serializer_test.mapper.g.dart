// This file has been generated by the dart_json_mapper v2.2.9
// https://github.com/k-paxian/dart-json-mapper
// @dart = 2.12
import 'package:dart_json_mapper/dart_json_mapper.dart'
    show
        JsonMapper,
        JsonMapperAdapter,
        SerializationOptions,
        DeserializationOptions,
        typeOf;
import 'package:todomvc/models/auth.dart' as x0 show Jwt, Credentials;
import 'package:todomvc/models/todo.dart' as x1 show Todo, UserTodo;
// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:dart_json_mapper/src/model/annotations.dart' as prefix0;
import 'package:todomvc/models/auth.dart' as prefix1;
import 'package:todomvc/models/todo.dart' as prefix2;

// ignore_for_file: camel_case_types
// ignore_for_file: implementation_imports
// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.JsonSerializable(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'Jwt',
            r'.Jwt',
            134217735,
            0,
            const prefix0.JsonSerializable(),
            const <int>[0, 10],
            const <int>[11, 12, 13, 14, 15, 9],
            const <int>[],
            -1,
            {},
            {},
            {r'': (bool b) => (token) => b ? prefix1.Jwt(token) : null},
            -1,
            0,
            const <int>[],
            const [prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'Credentials',
            r'.Credentials',
            134217735,
            1,
            const prefix0.JsonSerializable(),
            const <int>[1, 2, 20],
            const <int>[11, 12, 13, 14, 15, 16, 17, 18, 19],
            const <int>[],
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix1.Credentials() : null},
            -1,
            1,
            const <int>[],
            const [prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'Todo',
            r'.Todo',
            134217735,
            2,
            const prefix0.JsonSerializable(),
            const <int>[3, 4, 5, 6, 7, 31, 32],
            const <int>[
              11,
              12,
              13,
              14,
              15,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30
            ],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (bool b) => ({task, due, done = false, doneAt, id}) => b
                  ? prefix2.Todo(
                      done: done, doneAt: doneAt, due: due, id: id, task: task)
                  : null,
              r'fromMap': (bool b) => (m) => b ? prefix2.Todo.fromMap(m) : null
            },
            -1,
            2,
            const <int>[],
            const [prefix0.jsonSerializable],
            null),
        r.NonGenericClassMirrorImpl(
            r'UserTodo',
            r'.UserTodo',
            134217735,
            3,
            const prefix0.JsonSerializable(),
            const <int>[8, 35],
            const <int>[
              11,
              12,
              13,
              14,
              15,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30,
              33,
              34
            ],
            const <int>[],
            2,
            {},
            {},
            {
              r'': (bool b) =>
                  (token, t) => b ? prefix2.UserTodo(token, t) : null
            },
            -1,
            3,
            const <int>[],
            const [prefix0.jsonSerializable],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(
            r'token',
            134349829,
            0,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4, const <int>[], const []),
        r.VariableMirrorImpl(
            r'email',
            134348805,
            1,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4, const <int>[], const []),
        r.VariableMirrorImpl(
            r'pass',
            134348805,
            1,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4, const <int>[], const []),
        r.VariableMirrorImpl(
            r'task',
            134348805,
            2,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4, const <int>[], const []),
        r.VariableMirrorImpl(
            r'due',
            134348805,
            2,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5, const <int>[], const []),
        r.VariableMirrorImpl(
            r'done',
            134348805,
            2,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'doneAt',
            67239941,
            2,
            const prefix0.JsonSerializable(),
            -1,
            7,
            7,
            const <int>[],
            const [const prefix0.JsonProperty(ignoreIfNull: true)]),
        r.VariableMirrorImpl(
            r'id',
            67239941,
            2,
            const prefix0.JsonSerializable(),
            -1,
            8,
            8,
            const <int>[],
            const [const prefix0.JsonProperty(ignoreIfNull: true)]),
        r.VariableMirrorImpl(
            r'token',
            134348805,
            3,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4, const <int>[], const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 0, 9),
        r.MethodMirrorImpl(r'', 0, 0, -1, 0, 0, const <int>[], const <int>[0],
            const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'==', 2097154, -1, -1, 6, 6, const <int>[],
            const <int>[1], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'toString', 2097154, -1, -1, 4, 4, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            524290,
            -1,
            -1,
            -1,
            -1,
            const <int>[],
            const <int>[2],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'hashCode', 2097155, -1, -1, 9, 9, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'runtimeType',
            2097155,
            -1,
            -1,
            10,
            10,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 1, 16),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 1, 17),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 2, 18),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 2, 19),
        r.MethodMirrorImpl(r'', 0, 1, -1, 1, 1, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 3, 21),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 3, 22),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 4, 23),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 4, 24),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 5, 25),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 5, 26),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 6, 27),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 6, 28),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 7, 29),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 7, 30),
        r.MethodMirrorImpl(
            r'',
            0,
            2,
            -1,
            2,
            2,
            const <int>[],
            const <int>[5, 6, 7, 8, 9],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'fromMap', 0, 2, -1, 2, 2, const <int>[],
            const <int>[10], const prefix0.JsonSerializable(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.JsonSerializable(), 8, 33),
        r.ImplicitSetterMirrorImpl(const prefix0.JsonSerializable(), 8, 34),
        r.MethodMirrorImpl(r'', 0, 3, -1, 3, 3, const <int>[],
            const <int>[16, 17], const prefix0.JsonSerializable(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'token',
            134349830,
            10,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            134348806,
            11,
            const prefix0.JsonSerializable(),
            -1,
            11,
            11,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            134348806,
            13,
            const prefix0.JsonSerializable(),
            -1,
            12,
            12,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_email',
            134348902,
            17,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_pass',
            134348902,
            19,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'task',
            134358022,
            31,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            #task),
        r.ParameterMirrorImpl(
            r'due',
            67252230,
            31,
            const prefix0.JsonSerializable(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            #due),
        r.ParameterMirrorImpl(
            r'done',
            134364166,
            31,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            false,
            #done),
        r.ParameterMirrorImpl(
            r'doneAt',
            67252230,
            31,
            const prefix0.JsonSerializable(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            #doneAt),
        r.ParameterMirrorImpl(
            r'id',
            67253254,
            31,
            const prefix0.JsonSerializable(),
            -1,
            8,
            8,
            const <int>[],
            const [],
            null,
            #id),
        r.ParameterMirrorImpl(
            r'm',
            151126022,
            32,
            const prefix0.JsonSerializable(),
            -1,
            13,
            14,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_task',
            134348902,
            22,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_due',
            134348902,
            24,
            const prefix0.JsonSerializable(),
            -1,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_done',
            134348902,
            26,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_doneAt',
            67240038,
            28,
            const prefix0.JsonSerializable(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_id',
            67240038,
            30,
            const prefix0.JsonSerializable(),
            -1,
            8,
            8,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'token',
            134349830,
            35,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r't',
            134348806,
            35,
            const prefix0.JsonSerializable(),
            2,
            2,
            2,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_token',
            134348902,
            34,
            const prefix0.JsonSerializable(),
            -1,
            4,
            4,
            const <int>[],
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.Jwt,
        prefix1.Credentials,
        prefix2.Todo,
        prefix2.UserTodo,
        String,
        DateTime,
        bool,
        DateTime,
        int,
        int,
        Type,
        Object,
        Invocation,
        const m.TypeValue<Map<String, dynamic>>().type,
        Map
      ],
      4,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'token': (dynamic instance) => instance.token,
        r'email': (dynamic instance) => instance.email,
        r'pass': (dynamic instance) => instance.pass,
        r'task': (dynamic instance) => instance.task,
        r'due': (dynamic instance) => instance.due,
        r'done': (dynamic instance) => instance.done,
        r'doneAt': (dynamic instance) => instance.doneAt,
        r'id': (dynamic instance) => instance.id
      },
      {
        r'email=': (dynamic instance, value) => instance.email = value,
        r'pass=': (dynamic instance, value) => instance.pass = value,
        r'task=': (dynamic instance, value) => instance.task = value,
        r'due=': (dynamic instance, value) => instance.due = value,
        r'done=': (dynamic instance, value) => instance.done = value,
        r'doneAt=': (dynamic instance, value) => instance.doneAt = value,
        r'id=': (dynamic instance, value) => instance.id = value,
        r'token=': (dynamic instance, value) => instance.token = value
      },
      null,
      [])
};

const _memberSymbolMap = null;

void _initializeReflectable(JsonMapperAdapter adapter) {
  if (!adapter.isGenerated) {
    return;
  }
  r.data = adapter.reflectableData!;
  r.memberSymbolMap = adapter.memberSymbolMap;
}

final serializerTestGeneratedAdapter = JsonMapperAdapter(
    title: 'todomvc',
    url: 'asset:todomvc/test/serializer_test.dart',
    reflectableData: _data,
    memberSymbolMap: _memberSymbolMap,
    valueDecorators: {
      typeOf<List<x0.Jwt>>(): (value) => value.cast<x0.Jwt>(),
      typeOf<Set<x0.Jwt>>(): (value) => value.cast<x0.Jwt>(),
      typeOf<List<x0.Credentials>>(): (value) => value.cast<x0.Credentials>(),
      typeOf<Set<x0.Credentials>>(): (value) => value.cast<x0.Credentials>(),
      typeOf<List<x1.Todo>>(): (value) => value.cast<x1.Todo>(),
      typeOf<Set<x1.Todo>>(): (value) => value.cast<x1.Todo>(),
      typeOf<List<x1.UserTodo>>(): (value) => value.cast<x1.UserTodo>(),
      typeOf<Set<x1.UserTodo>>(): (value) => value.cast<x1.UserTodo>()
    },
    enumValues: {});

Future<JsonMapper> initializeJsonMapperAsync(
        {Iterable<JsonMapperAdapter> adapters = const [],
        SerializationOptions? serializationOptions,
        DeserializationOptions? deserializationOptions}) =>
    Future(() => initializeJsonMapper(
        adapters: adapters,
        serializationOptions: serializationOptions,
        deserializationOptions: deserializationOptions));

JsonMapper initializeJsonMapper(
    {Iterable<JsonMapperAdapter> adapters = const [],
    SerializationOptions? serializationOptions,
    DeserializationOptions? deserializationOptions}) {
  JsonMapper.globalSerializationOptions =
      serializationOptions ?? JsonMapper.globalSerializationOptions;
  JsonMapper.globalDeserializationOptions =
      deserializationOptions ?? JsonMapper.globalDeserializationOptions;
  JsonMapper.enumerateAdapters([...adapters, serializerTestGeneratedAdapter],
      (JsonMapperAdapter adapter) {
    _initializeReflectable(adapter);
    JsonMapper().useAdapter(adapter);
  });
  return JsonMapper();
}
