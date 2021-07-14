import 'package:flutter/material.dart';
import 'package:gseemobile/admin/admin_home.dart';
import 'package:gseemobile/admin/livre/add/add_livre.dart';
import 'package:gseemobile/admin/user_biblio/add/add_biblio.dart';
import 'package:gseemobile/admin/user_etudiant/add/add_etudiant.dart';
import 'package:gseemobile/biblio/biblio_home.dart';
import 'package:gseemobile/etudiant/etudiant_home.dart';
import 'package:gseemobile/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = {

 LoginScreen.routeName: (context) => LoginScreen(),
 EtudiantHome.routeName: (context) => EtudiantHome(),
 BiblioHome.routeName: (context) => BiblioHome(),
 AdminHome.routeName: (context) => AdminHome(),
 AddLivre.routeName: (context) => AddLivre(),
 AddBiblio.routeName: (context) => AddBiblio(),
 AddEtudiant.routeName: (context) => AddEtudiant(),

 
};
