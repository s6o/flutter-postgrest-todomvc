import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomvc/api.dart';
import 'package:todomvc/models/app_model.dart';
import 'package:todomvc/models/app_error.dart';
import 'package:todomvc/models/todo.dart';

class TodoDetails extends StatefulWidget {
  const TodoDetails({super.key});

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFe3f2fd),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(16),
      height: 250,
      child: Form(
        key: _formKey,
        child: Consumer<AppModel>(
          builder: (context, model, _) {
            return Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: 'Task'),
                  initialValue: model.newTodo.task,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Task is required' : null,
                  onSaved: (v) => model.newTodo.task = v!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                      labelText: 'Due (YYYY-MM-DD HH24:MI:SS)'),
                  initialValue:
                      model.newTodo.id != null && model.newTodo.id! > 0
                          ? model.newTodo.due.toString()
                          : '',
                  keyboardType: TextInputType.datetime,
                  textCapitalization: TextCapitalization.none,
                  validator: (v) =>
                      v == null || v.isNotEmpty && DateTime.tryParse(v) == null
                          ? 'Incorrect timestamp format.'
                          : null,
                  onSaved: (v) => model.newTodo.due = v != null && v.isNotEmpty
                      ? DateTime.tryParse(v)?.toUtc() ?? Todo.dueDefault()
                      : Todo.dueDefault(),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        model.newTodo = Todo(task: '');
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          try {
                            if (model.newTodo.id != null &&
                                model.newTodo.id! > 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sending updated todo ...'),
                                ),
                              );
                              await Api.updateTodo(model.jwt, model.newTodo)
                                  .then((Todo t) {
                                model.updateTodo(t);
                                model.newTodo = Todo(task: '');
                                Navigator.pop(context);
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sending new todo ...'),
                                ),
                              );

                              await Api.newTodo(model.jwt, model.newTodo)
                                  .then((Todo t) {
                                model.appendTodo(t);
                                model.newTodo = Todo(task: '');
                                Navigator.pop(context);
                              });
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text((e as AppError).message),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            );
          },
          /*
          builder: (BuildContext ctx, AppModel model, Widget w) {
          },
          */
        ),
      ),
    );
  }
}
