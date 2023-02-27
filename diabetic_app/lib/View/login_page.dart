import 'package:flutter/material.dart';
import 'package:diabetic_app/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  //Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              //username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'ejemplo@correo.com',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Contraseña',
                obscureText: true,
              ),
              const SizedBox(height: 15),
              //forgot password?

              //sign in button

              //or continue with

              //google + facebook sign in buttons

              //not a member? register now

            ],
          ),
        ),
      ),
    );
  }
}
