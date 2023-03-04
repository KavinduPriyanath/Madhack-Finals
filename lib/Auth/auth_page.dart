import 'package:flutter/material.dart';
import 'package:login_flutter/Pages/login_page.dart';
import 'package:login_flutter/Pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void ToggleScreens() {

    setState(() {
      showLoginPage = !showLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: ToggleScreens);
    } else {
      return RegisterPage(showLoginPage: ToggleScreens);
    }
  }
}
