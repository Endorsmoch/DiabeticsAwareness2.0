import 'dart:math';
import 'package:flutter/material.dart';
import 'package:diabetic_app/my_widgets/bad_food.dart';
import 'package:diabetic_app/my_widgets/good_food.dart';
import 'package:flutter/foundation.dart';


class FoodRain extends StatefulWidget {
  const FoodRain({Key? key}) : super(key: key);

  @override
  _FoodRainState createState() => _FoodRainState();
}

class _FoodRainState extends State<FoodRain> with SingleTickerProviderStateMixin {
  List<Widget> _foodList = [];
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..repeat();

    _animation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 1.5),
    ).animate(_animationController);

    _generateFoods();
  }

  void _generateFoods() {
    for (var i = 0; i < 20; i++) {
      final food = Random().nextInt(2) == 0 ? GoodFood() : BadFood();
      _foodList.add(food);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideTransition(
          position: _animation,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                for (int i = 0; i < _foodList.length; i++)
                  FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: i * 2000)),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.done
                          ? Positioned(
                        left: Random()
                            .nextInt(MediaQuery.of(context).size.width.toInt() - 45)
                            .toDouble(),
                        child: _foodList[i],
                      )
                          : Container();
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideTransition(
          position: _animation,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: _foodList
                  .map(
                    (food) => Positioned(
                  left: Random().nextInt(MediaQuery.of(context).size.width.toInt() - 45).toDouble(),
                  child: food,
                ),
              )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }*/



  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
