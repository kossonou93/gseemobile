import 'package:flutter/material.dart';
import 'package:gseemobile/etudiant/body.dart';
import 'package:gseemobile/etudiant/etudiant_menu.dart';

class EtudiantHome extends StatelessWidget {
  //const EtudiantHome({ Key? key }) : super(key: key);
  static String routeName = "/etudianthome";
  var value;
  EtudiantHome({this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: EtudiantMenu(value: value),
      appBar: AppBar(
        title: Text(
          "Menu"
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
        ],
        backgroundColor: Color(0xFF283593),
      ),
      body: Body(value: value)
    );
  }
}