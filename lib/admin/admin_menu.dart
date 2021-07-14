import 'package:flutter/material.dart';
import 'package:gseemobile/admin/livre/add/add_livre.dart';
import 'package:gseemobile/admin/user_biblio/add/add_biblio.dart';
import 'package:gseemobile/admin/user_etudiant/add/add_etudiant.dart';
import 'package:gseemobile/constants.dart';
import 'package:gseemobile/etudiant/etudiant_home.dart';
import 'package:gseemobile/login/login_screen.dart';

class AdminMenu extends StatelessWidget {
  //const AdminMenu({ Key? key }) : super(key: key);
  var value;
  AdminMenu({this.value});

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
          currentAccountPicture: CircleAvatar(child: Text("Admin")),
          decoration: BoxDecoration(color: Color(0xFF283593)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, EtudiantHome.routeName),
        ),
        ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Enregistrer Bibliothécaire"),
            onTap: () => Navigator.pushReplacementNamed(context, AddBiblio.routeName),
            ),
        ListTile(
            leading: Icon(Icons.group),
            title: Text("Voir Bibliothécaires"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Enregistrer Etudiant"),
            onTap: () => Navigator.pushReplacementNamed(context, AddEtudiant.routeName),
            ),
        ListTile(
            leading: Icon(Icons.group),
            title: Text("Voir Etudiants"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
            leading: Icon(Icons.note_add),
            title: Text("Enregistrer Livre"),
            onTap: () => Navigator.pushReplacementNamed(context, AddLivre.routeName),
            ),
        ListTile(
            leading: Icon(Icons.book),
            title: Text("Voir Livres"),
            //onTap: () => Navigator.pushReplacementNamed(context, ConsultationScreen.routeName),
            ),
        ListTile(
          leading: Icon(Icons.settings_power),
          title: Text("Déconnexion"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, LoginScreen.routeName),
        ),
      ],
    )),
        );
  }
}