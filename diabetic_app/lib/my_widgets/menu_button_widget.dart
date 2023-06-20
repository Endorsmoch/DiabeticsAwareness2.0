import 'package:flutter/material.dart';
import 'package:diabetic_app/pages/login_register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Button Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu Button Widget'),
        ),
        body: Center(
          child: MenuButtonWidget(),
        ),
      ),
    );
  }
}

class MenuButtonWidget extends StatefulWidget {
  @override
  State createState() => _MenuButtonWidgetState();

}

class _MenuButtonWidgetState extends State<MenuButtonWidget>{

  void onPressed() {

  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(child: Row(children: [
          Text('Quiz'),
        ],),),
        PopupMenuItem(child: Row(children: [
          Text('Opción 1'),
        ],),),
        PopupMenuItem(child: Row(children: [
          Text('Opción 2'),
        ],),),
        PopupMenuItem(
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Iniciar Sesión'),
          )

        ),
      ],
      child: Icon(Icons.menu, size: 36,),
    );
  }
}