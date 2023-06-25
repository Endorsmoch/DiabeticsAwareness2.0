import 'package:flutter/material.dart';

class CongratsCardWidget extends StatelessWidget{

  int level = 0;

  CongratsCardWidget({required this.level});

  void shareWithFacebook(int level){

  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text("¡Felicidades!\n Completaste exitosamente el nivel.",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40,),
                ElevatedButton(
                  onPressed: () => shareWithFacebook(this.level),
                  child: Text(
                      'Compartir en Facebook'
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}