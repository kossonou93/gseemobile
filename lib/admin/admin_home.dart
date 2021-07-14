import 'package:flutter/material.dart';
import 'package:gseemobile/admin/admin_menu.dart';
import 'package:gseemobile/admin/body.dart';

class AdminHome extends StatelessWidget {
  //const AdminHome({ Key? key }) : super(key: key);
  static String routeName = "/adminhome";
  var value;
  //String email = "";

  //Future getEmail()async{
  //  SharedPreferences preferences = await SharedPreferences.getInstance();
  //  email = preferences.getString('email');
  //}
  AdminHome({this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminMenu(value: value),
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