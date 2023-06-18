import 'package:diabetic_app/my_classes/news.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:diabetic_app/auth.dart';
import 'package:diabetic_app/my_widgets/news_card_widget.dart';
import 'package:diabetic_app/controllers/news_controller.dart';

class HomePage extends StatefulWidget{
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final User? user = Auth().currentUser;
  List<NewsCard> news = [];
  NewsController newsController = NewsController();

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Diabetic App'); //DEBE MODIFICARSE CUANDO SE TENGA UN NOMBRE MÁS ADECUADO
  }

  Widget _userUid() {
    return Text(user?.email ?? 'Correo de Usuario');
  }

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: signOut,
        child: const Text('Cerrar Sesión'),
    );
  }

  List<Widget> _buildNewsList() {
    List<Widget> widgets = [];
    for(int i = 0; i < news.length; i++){
      widgets.add(news[i]);
      if(i != news.length - 1){
        widgets.add(SizedBox(height: 20,));
      }
    }
    return widgets;
  }

  @override
    void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    await newsController.readJSONFromFile();
    setState(() {
      news = newsController.generateNewsWidgets();
    });
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children:[
                    Text('¿Sabías qué?'),
                    SizedBox(height: 20),

                    ..._buildNewsList(),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Text(
            '¿Sabías qué?',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          // Add the newsWidgets using addAll
          ..._buildNewsList(),
        ],
      ),
    );
  }

}
