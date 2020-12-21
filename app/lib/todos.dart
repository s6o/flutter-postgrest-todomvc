import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomvc/api.dart';
import 'package:todomvc/models/app_model.dart';
import 'package:todomvc/models/todo.dart';

class Todos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AppModel>(
        builder: (BuildContext ctx, AppModel model, Widget _) {
          return ListView.builder(
            itemCount: model.todos.length,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                leading: Checkbox(
                  value: model.todos[index].done,
                  onChanged: (b) {
                    print('${model.todos[index].task} - $b');
                    Api.toggle(model.jwt, model.todos[index]).then((b) {
                      model.toggle(index);
                      print('Toggle synced: $b');
                    });
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    Api.deleteTodo(model.jwt, model.todos[index])
                        .then((Todo t) => model.deleteTodo(t));
                  },
                ),
                title: Text(model.todos[index].task),
                subtitle:
                    Text('Due: ${model.todos[index].due.toLocal().toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}
