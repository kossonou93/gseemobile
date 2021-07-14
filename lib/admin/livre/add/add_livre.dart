import 'package:flutter/material.dart';
import 'package:gseemobile/admin/admin_home.dart';
import 'package:gseemobile/admin/livre/add/body.dart';


class AddLivre extends StatelessWidget {
  //const AddLivre({Key? key}) : super(key: key);
  static String routeName = "/addlivre";
  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: AdminMenu(value: value),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, AdminHome.routeName),
        ),
        title: Text(
          "Ajouter Livre"
        ),
        backgroundColor: Color(0xFF283593),
      ),
      body: Body(),
    );
  }
}