import 'package:flutter/material.dart';
import 'package:gseemobile/biblio/body.dart';
import 'package:gseemobile/biblio/biblio_menu.dart';

class BiblioHome extends StatelessWidget {
  //const BiblioHome({Key? key}) : super(key: key);
  static String routeName = "/bibliohome";
  var value;
  BiblioHome({this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BiblioMenu(value: value),
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
      body: Body(value: value),
    );
  }
}