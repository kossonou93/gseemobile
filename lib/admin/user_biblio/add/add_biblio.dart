import 'package:flutter/material.dart';
import 'package:gseemobile/admin/admin_home.dart';
import 'package:gseemobile/admin/user_biblio/add/body.dart';

class AddBiblio extends StatelessWidget {
  //const AddBiblio({ Key? key }) : super(key: key);
  static String routeName = "/addbiblio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AdminHome.routeName),
        ),
        title: Text(
          "Ajouter Bibliothécaire"
        ),
        backgroundColor: Color(0xFF283593),
      ),
      body: Body(),
    );
  }
}