import 'package:diabetic_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:diabetic_app/my_classes/auth.dart';

import '../my_widgets/menu_button_widget.dart';

class ConfigPage extends StatefulWidget{

  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final User? user = Auth().currentUser;
  bool editable = false;

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPController = TextEditingController();
  final TextEditingController _apellidoMController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> signOut() async {
    await Auth().signOut();
    Navigator.push(context, 
        MaterialPageRoute(builder: (context) => HomePage())
    );
  }

  void editButtonPressed() {
    setState(() {
      editable = true;
    });
  }
  void saveButtonPressed() {
    setState(() {
      editable = false;
    });
    //Logica de guardado
  }

  void cancelButtonPressed() {
    setState(() {
      editable = false;
    });
  }

  Widget _title(String title) {
    return Text(title.isEmpty? 'Titulo': title ,
      style: TextStyle(
        fontSize: 26
      ),
    );
  }

  Widget _editButton() {
    return ElevatedButton(
        onPressed: editButtonPressed,
        child: Text(
            'Editar',
            style: TextStyle(
                fontSize: 24
            )
        ),
    );
  }

  Widget _saveButton() {
    return ElevatedButton(
        onPressed: saveButtonPressed,
        child: Text(
            'Guardar',
            style: TextStyle(
                fontSize: 24
            )
        )
    );
  }

  Widget _cancelButton() {
    return ElevatedButton(
        onPressed: cancelButtonPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.redAccent,
        ),
      child: Text(
          'Cancelar',
          style: TextStyle(
            fontSize: 24
          ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller, bool editable) {
    return TextField(
      style: TextStyle(fontSize: 20),
      controller: controller,
      decoration: InputDecoration(
          labelText: title,
          hintText: title,
          alignLabelWithHint: false,
          enabled: editable
      ),
    );
  }

  Widget _infoArea() {
   return Container(
        child: Column(
          children: [
            _entryField('Nombre', _nombreController, editable),
            SizedBox(height: 5,),
            _entryField('Apellido Paterno', _apellidoPController, editable),
            SizedBox(height: 5,),
            _entryField('Apellido Materno', _apellidoMController, editable),
            SizedBox(height: 5,),
            _entryField('Teléfono Celular', _telefonoController, editable),
            SizedBox(height: 5,),
            _entryField('Correo Electrónico', _emailController, editable),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                editable? _cancelButton() : SizedBox(),
                SizedBox(width: 5,),
                editable? _saveButton() : _editButton()
              ],
            )
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title("Configuración"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: MenuButtonWidget(),
          )
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white60,
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 20, right: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title("Tu perfil"),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  _infoArea(),
                  SizedBox(height: 20,),
                  _title("Inicio de Sesión"),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  TextButton(onPressed: signOut,
                    child: Text("Cerrar sesión",
                      style:TextStyle(
                          fontSize: 24,
                          color: Colors.grey
                      ),),
                  ),
                ],
              ),
            ),
        )
      ),
    );
  }
}