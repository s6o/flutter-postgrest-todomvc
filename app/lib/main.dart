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

class TodoMVC extends StatefulWidget {
  @override
  _TodoMVCState createState() => _TodoMVCState();
}

class _TodoMVCState extends State<TodoMVC> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
            builder: (BuildContext ctx, AppModel model, Widget w) {
              return Text('Todos ${model.filterTitle}');
            },
          ),
        ),
        body: Consumer<AppModel>(
          builder: (BuildContext ctx, AppModel model, Widget _) =>
              model.isAuthorized ? Todos() : LoginPage(),
        ),
        drawer: Consumer<AppModel>(
          builder: (BuildContext ctx, AppModel model, Widget w) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Text('TodoMVC'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
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
          title: Text('Logout'),
          onTap: () {
            model.unAuthorize();
            _scaffoldKey.currentState.openEndDrawer();
          }),
      Divider(),
      SwitchListTile(
          title: Text('All'),
          value: model.hasFilter(TodoFilter.All),
          onChanged: (bool b) {
            model.setFilter(b ? TodoFilter.All : TodoFilter.Active);
            _scaffoldKey.currentState.openEndDrawer();
          }),
      SwitchListTile(
          title: Text('Active'),
          value: model.hasFilter(TodoFilter.Active),
          onChanged: (bool b) {
            model.setFilter(b ? TodoFilter.Active : TodoFilter.Completed);
            _scaffoldKey.currentState.openEndDrawer();
          }),
      SwitchListTile(
          title: Text('Completed'),
          value: model.hasFilter(TodoFilter.Completed),
          onChanged: (bool b) {
            model.setFilter(b ? TodoFilter.Completed : TodoFilter.All);
            _scaffoldKey.currentState.openEndDrawer();
          }),
      Divider(),
      ListTile(
        title: Text('New'),
        onTap: () {},
      ),
    ];
  }
}
