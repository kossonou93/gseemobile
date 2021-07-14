import 'package:flutter/material.dart';
import 'package:gseemobile/admin/admin_home.dart';
import 'package:gseemobile/admin/user_etudiant/add/add_etudiant.dart';
import 'package:gseemobile/api/rest_api.dart';
import 'package:gseemobile/etudiant/etudiant_home.dart';
import 'package:toast/toast.dart';

class Body extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final usernameController = new TextEditingController();
  final nomController = new TextEditingController();
  final prenomController = new TextEditingController();
  final contactController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 100,
              ),
          child: Column(
            children: [
              buildNom(),
              SizedBox(height: 10,),
              buildPrenom(),
              SizedBox(height: 10,),
              buildUsername(),
              SizedBox(height: 10,),
              buildEmail(),
              SizedBox(height: 10,),
              buildContact(),
              SizedBox(height: 10,),
              buildPassword(),
              SizedBox(height: 30,),
              buildValideBtn(context),
            ],
          ),
        ),
      ),
        )
    );
  }

  Widget buildNom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2)
              )
            ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: nomController,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.person_outline,
                color: Color(0xFF283593)
              ),
              hintText: 'Nom',
              hintStyle: TextStyle(
                color: Color(0xFF283593)
              )
              //alignLabelWithHint: 
              ),
          ),
        )
      ],
    );
  }

  Widget buildPrenom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2)
              )
            ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: prenomController,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xFF283593)
              ),
              hintText: 'Prénom',
              hintStyle: TextStyle(
                color: Color(0xFF283593)
              )
              //alignLabelWithHint: 
              ),
          ),
        )
      ],
    );
  }

  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2)
              )
            ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            controller: usernameController,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xFF283593)
              ),
              hintText: 'Username',
              hintStyle: TextStyle(
                color: Color(0xFF283593)
              )
              //alignLabelWithHint: 
              ),
          ),
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2)
              )
            ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xFF283593)
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Color(0xFF283593)
              )
              //alignLabelWithHint: 
              ),
          ),
        )
      ],
    );
  }

  Widget buildContact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2)
              )
            ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.phone,
            controller: contactController,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.contact_phone,
                color: Color(0xFF283593)
              ),
              hintText: 'Contact',
              hintStyle: TextStyle(
                color: Color(0xFF283593)
              )
              //alignLabelWithHint: 
              ),
          ),
        )
      ],
    );
  }

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          obscureText: true,
          controller: passwordController,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top:14),
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xFF283593)
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Color(0xFF283593)
            )
            //alignLabelWithHint: 
            ),
        ),
      )
    ],
  );
}

Widget buildValideBtn(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async{
          //Navigator.pushNamed(context, EtudiantHome.routeName)
             if (_formKey.currentState.validate()) {
                 ApiService connexion = new ApiService();
                var response = await connexion.addEtudiant(nomController.value.text, prenomController.value.text, usernameController.value.text, emailController.value.text, contactController.value.text, passwordController.value.text);
                //Navigator.pushNamed(context, EtudiantHome.routeName);
                print(response);
                //return;
                
                if (response == null) {
                   Toast.show("L'étudiant n'a pas été enregistré", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return Navigator.pushNamed(context, AddEtudiant.routeName);
                }
                if (response != null) {
                  Toast.show("L'étudiant a été enregistré avec succès!", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                  return Navigator.pushNamed(context, AdminHome.routeName);
                }
                //Toast.show("Email ou Mot de Passe Incorrect", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                

              }
            },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Color(0xFF283593),
        child: Text(
          "Enregistrer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        )
    );
  }

}