import 'package:flutter/material.dart';

class MyMovableCharacter extends StatefulWidget {
  @override
  _MyMovableCharacterState createState() => _MyMovableCharacterState();

}

class _MyMovableCharacterState extends State<MyMovableCharacter> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          if (_left + details.delta.dx >= 0 && _left + details.delta.dx <= MediaQuery.of(context).size.width - 75.0) {
            _left += details.delta.dx;
          }
        });
      },
      child: Container(
        height: 75.0,
        width: 75.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(left: _left),
      ),
    );
  }
}