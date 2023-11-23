import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomvc/api.dart';
import 'package:todomvc/models/app_model.dart';
import 'package:todomvc/models/todo.dart';
import 'package:todomvc/todo_details.dart';

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, _) {
        return ListView.builder(
          itemCount: model.todos.length,
          itemBuilder: (BuildContext ctx, int index) {
            return ListTile(
              leading: Checkbox(
                value: model.todos[index].done,
                onChanged: (b) {
                  debugPrint('${model.todos[index].task} - $b');
                  Api.toggle(model.jwt, model.todos[index]).then((b) {
                    model.toggle(index);
                    debugPrint('Toggle synced: $b');
                  });
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  Api.deleteTodo(model.jwt, model.todos[index])
                      .then((Todo t) => model.deleteTodo(t));
                },
              ),
              title: Text(model.todos[index].task),
              onTap: () {
                model.newTodo = model.todos[index];
                Scaffold.of(context)
                    .showBottomSheet((context) => const TodoDetails());
              },
              subtitle:
                  Text('Due: ${model.todos[index].due.toLocal().toString()}'),
            );
          },
        );
      },
    );
  }
}
