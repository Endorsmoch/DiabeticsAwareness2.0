import 'package:diabetic_app/my_classes/auth.dart';
import 'package:diabetic_app/pages/home_page.dart';
import 'package:diabetic_app/pages/login_register_page.dart';
import 'package:diabetic_app/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();

}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
       stream: Auth().authStateChanges,
       builder: (context, snapshot) {
         return HomePage();
         /*if(snapshot.hasData) {
           return HomePage();
         } else {
           return HomePage();
         }*/
       },
   );
  }

}