import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  Map _userObj = {};

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      await Auth().signInWithFacebook();
    } on FirebaseAuthException catch (e,s) {
      print('Error $e, Stacktrace:$s');
    }
  }
  Future<void> signInWithGoogle() async {
    try{
      await Auth().signInWithGoogle();
    } on FirebaseAuthException catch (e,s) {
      print('Error $e, Stacktrace: $s');
    }
  }

  Widget _title() {
    return const Text('Diabetic App');
  }

  Widget _entryField(
      String title,
      TextEditingController controller,
      ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed:
        isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Iniciar Sesión' : 'Registrarse'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Regístrese' : 'Inicie Sesión'),
    );
  }

  Widget _loginWithFacebookButton(){
    return ElevatedButton(
        onPressed: signInWithFacebook,
        child: Text('Inicia Sesión con Facebook'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
    );
  }

  Widget _loginWithGoogleButton(){
    return ElevatedButton(
        onPressed: signInWithGoogle,
        child: Text('Inicia Sesión con Google'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
        ),
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
            _entryField('Correo', _controllerEmail),
            _entryField('Contraseña', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
            const SizedBox(height: 80,),
            _loginWithFacebookButton(),
            _loginWithGoogleButton(),
          ],
        ),
      ),
    );
  }
}