import 'package:flutter/material.dart';
import 'package:my_app/app_routes.dart';
import 'package:my_app/modules/login/data/provider/login_cache_provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateForm = AutovalidateMode.disabled;
  LoginCacheProvider loginCacheProvider = new LoginCacheProvider();

  navigateNamedToHome(context) {
    Navigator.pushNamedAndRemoveUntil(context, kHomeRoute, (_) => false);
  }

  _onLoginButtonPressed() {
    print('pushed');
    if (_formKey.currentState.validate()) {
      loginCacheProvider.saveIsConnected(true);
      navigateNamedToHome(context);
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      _formKey.currentState.validate();
      setState(() => _autoValidateForm = AutovalidateMode.always);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Center(
        child: Card(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
                autovalidateMode: _autoValidateForm,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'E-mail'),
                          controller: _emailController,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mot de passe'),
                          controller: _passwordController,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: OutlinedButton(
                              onPressed: _onLoginButtonPressed,
                              child: Text('Se Connecter')),
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
