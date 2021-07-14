import 'package:flutter/material.dart';
import 'package:gseemobile/biblio/biblio_home.dart';
import 'package:gseemobile/constants.dart';
import 'package:gseemobile/login/login_screen.dart';

class BiblioMenu extends StatelessWidget {
  //const BiblioMenu({ Key? key }) : super(key: key);
  var value;
  BiblioMenu({this.value});

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
          currentAccountPicture: CircleAvatar(child: Text("Bibliothécaire")),
          decoration: BoxDecoration(color: Color(0xFF283593)),
        ),
        ///*
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, BiblioHome.routeName),
        ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Retour Livre"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Voir Retours Livres"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Enregistrer Livre"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Voir Livres"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
            leading: Icon(Icons.business_center),
            title: Text("Voir Réservations"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
          leading: Icon(Icons.settings_power),
          title: Text("Déconnexion"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, LoginScreen.routeName),
        ),
      ],
    ),
  )
  );
  }
}