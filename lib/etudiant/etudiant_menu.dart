import 'package:flutter/material.dart';
import 'package:gseemobile/constants.dart';
import 'package:gseemobile/etudiant/etudiant_home.dart';
import 'package:gseemobile/login/login_screen.dart';

class EtudiantMenu extends StatelessWidget {
  //const EtudiantMenu({ Key? key }) : super(key: key);
  var value;
  EtudiantMenu({this.value});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
          child: Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("${value['username']}"),
          accountEmail: Text("${value['email']}"),
          currentAccountPicture: CircleAvatar(child: Text("Etudiant")),
          decoration: BoxDecoration(color: Color(0xFF283593)),
        ),
        ///*
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, EtudiantHome.routeName),
        ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Voir Livres"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Faire Réservation"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
          leading: Icon(Icons.settings_power),
          title: Text("Déconnexion"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, LoginScreen.routeName),
        ),
      ],
    )
        )
        );
  }
}