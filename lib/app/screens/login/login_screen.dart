import 'package:flutter/material.dart';
import 'package:my_app/app/screens/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
    );
  }
}
