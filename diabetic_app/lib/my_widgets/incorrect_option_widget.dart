import 'package:flutter/material.dart';

class IncorrectOptionWidget extends StatefulWidget {
final String text;
final Color baseColor = Color(0xFFE0E0E0);

IncorrectOptionWidget({required this.text});

@override
_IncorrectOptionWidgetState createState() => _IncorrectOptionWidgetState();

}

class _IncorrectOptionWidgetState extends State<IncorrectOptionWidget> {
  bool isPressed = false;

  void onTap() {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: isPressed ? Colors.redAccent : widget.baseColor,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}