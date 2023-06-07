import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divided Rectangles Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DividedRectanglesWidget(),
    );
  }
}

class DividedRectanglesWidget extends StatefulWidget {
  @override
  _DividedRectanglesWidgetState createState() => _DividedRectanglesWidgetState();
}

class _DividedRectanglesWidgetState extends State<DividedRectanglesWidget> {
  bool showCard = false;

  void _toggleCardVisibility() {
    setState(() {
      showCard = !showCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Divided Rectangles'),
      ),
      body: GestureDetector(
        onTap: _toggleCardVisibility,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            if (showCard)
              Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Pregunta...',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}