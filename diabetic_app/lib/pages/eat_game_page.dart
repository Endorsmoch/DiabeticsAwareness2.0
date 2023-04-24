import 'package:diabetic_app/controllers/food_rain.dart';
import 'package:flutter/material.dart';
import 'package:diabetic_app/my_widgets/my_movable_character.dart';
import 'package:diabetic_app/my_widgets/bad_food.dart';
import 'package:diabetic_app/my_widgets/good_food.dart';

class EatGamePage extends StatelessWidget {
  const EatGamePage({Key? key}) : super(key: key);

  Widget _title() {
    return const Text('Lluvia de Comida');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        color: Colors.grey,
        height: double.maxFinite,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
                  color: Colors.white54,
                  child: Row(
                    children: <Widget>[
                      GoodFood(),
                      BadFood(),
                    ],
                  ),
                ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MyMovableCharacter()
              ],
            ),
          ],
        ),
      ),
    );
  }

}

