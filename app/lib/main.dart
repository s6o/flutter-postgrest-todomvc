import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:todomvc/login.dart';
import 'package:todomvc/models/app_model.dart';
import 'package:todomvc/todo_details.dart';
import 'package:todomvc/todos.dart';
import 'package:todomvc/models/todo.dart';

import 'main.mapper.g.dart' show initializeJsonMapper;

void main() {
  initializeJsonMapper(adapters: [
    JsonMapperAdapter(valueDecorators: {
      typeOf<List<Todo>>(): (value) => value.cast<Todo>(),
    })
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppModel(),
      child: const TodoMVC(),
    ),
  );
}

class TodoMVC extends StatefulWidget {
  const TodoMVC({super.key});

  @override
  State<TodoMVC> createState() => _TodoMVCState();
}

class _TodoMVCState extends State<TodoMVC> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoMVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Consumer<AppModel>(
            builder: (context, model, _) => Text('Todos ${model.filterTitle}'),
          ),
        ),
        body: Consumer<AppModel>(
          builder: (context, model, _) =>
              model.isAuthorized ? const Todos() : const LoginPage(),
        ),
        drawer: Consumer<AppModel>(
          builder: (context, model, _) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('TodoMVC'),
                  ),
                  if (model.isAuthorized) ..._authorizedItems(context, model),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _authorizedItems(BuildContext context, AppModel model) {
    return <Widget>[
      ListTile(
          title: const Text('Logout'),
          onTap: () {
            model.unAuthorize();
            _scaffoldKey.currentState?.openEndDrawer();
          }),
      const Divider(),
      SwitchListTile(
          title: const Text('All'),
          value: model.hasFilter(TodoFilter.all),
          onChanged: (bool b) {
            model.setFilter(b ? TodoFilter.all : TodoFilter.active);
            _scaffoldKey.currentState?.openEndDrawer();
          }),
      SwitchListTile(
          title: const Text('Active'),
          value: model.hasFilter(TodoFilter.active),
          onChanged: (bool b) {
            model.setFilter(b ? TodoFilter.active : TodoFilter.completed);
            _scaffoldKey.currentState?.openEndDrawer();
          }),
      SwitchListTile(
          title: const Text('Completed'),
          value: model.hasFilter(TodoFilter.completed),
          onChanged: (bool b) {
            model.setFilter(b ? TodoFilter.completed : TodoFilter.all);
            _scaffoldKey.currentState?.openEndDrawer();
          }),
      const Divider(),
      ListTile(
        title: const Text('New'),
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
          _scaffoldKey.currentState
              ?.showBottomSheet((context) => const TodoDetails());
        },
      ),
    ];
  }
}
