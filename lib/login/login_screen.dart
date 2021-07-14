import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gseemobile/admin/admin_home.dart';
import 'package:gseemobile/api/rest_api.dart';
import 'package:gseemobile/biblio/biblio_home.dart';
import 'package:gseemobile/etudiant/etudiant_home.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {

static String routeName = "/login";
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String phone;
  String password;
  bool remember = false;
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final List<String> errors = [];
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFF),
                      Color(0xFFFFFFF),
                      Color(0xFFFFFFF),
                      Color(0xFFFFFFF),
                      //Color(0xFF283593),
                    ])
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Connexion',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 50,),
                    buildEmail(),
                    SizedBox(height: 20,),
                    buildPassword(),
                    SizedBox(height: 20,),
                    buildLoginBtn()
                  ],
                ),
                ),
              )
            ],
          )
          )
      )
    )
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

Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async{
          //Navigator.pushNamed(context, EtudiantHome.routeName)
             if (_formKey.currentState.validate()) {
                 ApiService connexion = new ApiService();
                var response = await connexion.signIn(emailController.value.text, passwordController.value.text);

                //SharedPreferences preferences = await SharedPreferences.getInstance();
                //preferences.setString('email', emailController.value.text);
                //Navigator.pushNamed(context, EtudiantHome.routeName);
                print(response["Data"]);
                //print("Roles " + response[1]);
                if (response["StatusCode"] == 401) {
                   Toast.show("Email ou Mot de Passe Incorrect", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return;
                }
                if (response["StatusCode"] == 400) {
                   Toast.show("Vous n'etes pas autorisé", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return;
                }
                if (response["StatusCode"] == 200) {

                  switch (response["Data"]["roles"][0]) {
                  case "ROLE_ADMIN" : 
                    //Navigator.pushNamed(context, AdminHome.routeName);
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdminHome(value : response["Data"]),));
                    break;
                  case "ROLE_BIBLIOTHECAIRE" :
                    //Navigator.pushNamed(context, BiblioHome.routeName);
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BiblioHome(value : response["Data"]),));
                    break;
                  case "ROLE_ETUDIANT" :
                    //Navigator.pushNamed(context, EtudiantHome.routeName);
                    Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EtudiantHome(value : response["Data"]),));
                    break;
                  //default:
                  //Navigator.pushNamed(context, EtudiantHome.routeName);
                  }
                }
                //Toast.show("Email ou Mot de Passe Incorrect", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                

              }
            },
        //=> print('Login Pressed'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Color(0xFF283593),
        child: Text(
          "Connexion",
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