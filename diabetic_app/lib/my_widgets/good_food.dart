import 'package:flutter/material.dart';

class GoodFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width: 3,
            color: Colors.black
        )
      ),
    );
  }
}