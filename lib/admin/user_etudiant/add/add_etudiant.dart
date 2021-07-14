import 'package:flutter/material.dart';
import 'package:gseemobile/etudiant/etudiant_home.dart';
import 'package:gseemobile/admin/user_etudiant/add/body.dart';

class AddEtudiant extends StatelessWidget {
  //const AddBiblio({ Key? key }) : super(key: key);
  static String routeName = "/addetudiant";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, EtudiantHome.routeName),
        ),
        title: Text(
          "Ajouter Etudiant"
        ),
        backgroundColor: Color(0xFF283593),
      ),
      body: Body(),
    );
  }
}