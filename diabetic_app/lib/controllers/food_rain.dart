import 'dart:math';
import 'package:flutter/material.dart';
import 'package:diabetic_app/my_widgets/bad_food.dart';
import 'package:diabetic_app/my_widgets/good_food.dart';

class BadFoodRain extends StatelessWidget {
  final BuildContext context;
  final int count;
  const BadFoodRain({Key? key, required this.context, required this.count}): super(key: key);

  @override
  build(BuildContext context){
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (BuildContext context, int index){
          return AnimatedPositioned(
            duration: Duration(seconds: 3),
            curve: Curves.easeIn,
            left: Random().nextDouble() * MediaQuery.of(context).size.width,
            top: -45,
            child: BadFood(),
          );
        }
    );
  }
}

class GoodFoodRain extends StatelessWidget {
  final BuildContext context;
  const GoodFoodRain({Key? key, required this.context}): super(key: key);

  @override
  Widget build(BuildContext context){
    return AnimatedPositioned(
      duration: Duration(seconds: 3),
      curve: Curves.easeIn,
      left: Random().nextDouble() * MediaQuery.of(context).size.width,
      top: -45,
      child: GoodFood(),
    );
  }
}



