import 'package:flutter/material.dart';
import 'package:diabetic_app/pages/login_register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Widget _title() {
    return const Text('Diabetic App');
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
        child: const Text('Iniciar Sesión'),
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _loginButton(context),
          ],
        ),
      ),
    );
  }

}