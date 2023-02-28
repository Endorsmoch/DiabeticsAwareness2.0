import 'dart:js_util';
import 'package:diabetic_app/components/my_button.dart';
import 'package:diabetic_app/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:diabetic_app/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  //Text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign user in Method
  void signUserIn() {}

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
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
              ),
               const SizedBox(height: 25),

              //sign in button
              MyButton(
                onTap: signUserIn,
              ),
              const SizedBox(height: 50),

              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'O iniciar Sesión con',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                    ),
                  ],
                ),
              ),

              //google + facebook sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  //Google
                  SquareTile(imagePath: 'lib/images/google.png'),
                  //Facebook
                  SquareTile(imagePath: 'lib/images/facebook.png')
                ],
              ),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No estás registrado?',
                    style: TextStyle( color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Regístrate Ahora',
                    style: TextStyle(
                      color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }



}
