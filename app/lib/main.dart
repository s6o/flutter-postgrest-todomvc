import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomvc/login.dart';
import 'package:todomvc/models/app_model.dart';
import 'package:todomvc/todos.dart';

import 'main.mapper.g.dart' show initializeJsonMapper;

void main() {
  initializeJsonMapper();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppModel(),
      child: TodoMVC(),
    ),
  );
}

class TodoMVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PostgREST TodoMVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter PostgREST TodoMVC'),
        ),
        body: Consumer<AppModel>(
          builder: (BuildContext ctx, AppModel model, Widget w) {
            return model.isAuthorized ? Todos() : LoginPage();
          },
        ),
      ),
    );
  }
}
