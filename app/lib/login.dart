import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomvc/api.dart';
import 'package:todomvc/models/app_model.dart';
import 'package:todomvc/models/auth.dart';
import 'package:todomvc/models/error.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          width: 400,
          child: Consumer<AppModel>(
            builder: (BuildContext ctx, AppModel model, Widget w) {
              return Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    validator: (v) => v.isEmpty ? 'Email is required' : null,
                    onSaved: (v) => model.credentials.email = v,
                  ),
                  TextFormField(
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
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Sending credentials ...')));

                        try {
                          Jwt jwt = await Api.login(model.credentials);
                          model.jwt = jwt;
                        } catch (e) {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text((e as Error).message)));
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
      ),
    );
  }
}
