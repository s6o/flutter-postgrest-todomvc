import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomvc/api.dart';
import 'package:todomvc/models/app_model.dart';
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/app_error.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Consumer<AppModel>(
          builder: (BuildContext ctx, AppModel model, Widget w) {
            return Column(
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  validator: (v) => v.isEmpty ? 'Email is required' : null,
                  onSaved: (v) => model.credentials.email = v,
                ),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  textCapitalization: TextCapitalization.none,
                  validator: (v) => v.isEmpty ? 'Password is required' : null,
                  onSaved: (v) => model.credentials.pass = v,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      try {
                        var ctrl = Scaffold.of(context).showBottomSheet(
                            (context) => Text('Sending credentials ...'));
                        Jwt jwt = await Api.login(model.credentials);
                        ctrl.close();

                        ctrl = Scaffold.of(context).showBottomSheet(
                            (context) => Text('Fetching todos ...'));
                        model.todos = await Api.todos(jwt);
                        ctrl.close();
                        model.jwt = jwt;
                      } catch (e) {
                        Scaffold.of(context).showBottomSheet(
                            (context) => Text((e as AppError).message));
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
