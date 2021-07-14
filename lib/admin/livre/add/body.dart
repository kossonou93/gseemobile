import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gseemobile/admin/admin_home.dart';
import 'package:gseemobile/admin/livre/add/add_livre.dart';
import 'package:gseemobile/api/rest_api.dart';
import 'package:toast/toast.dart';

class Body extends StatelessWidget {
  //const Body({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final libelleController = new TextEditingController();
  final auteurController = new TextEditingController();
  final ouvrageController = new TextEditingController();

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
              buildLibelle(),
              SizedBox(height: 10,),
              buildAuteur(),
              SizedBox(height: 10,),
              buildOuvrage(),
              SizedBox(height: 20,),
              buildValideBtn(context),
            ],
          ),
        ),
      ),
        )
    );
  }

  Widget buildLibelle() {
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
            controller: libelleController,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.book,
                color: Color(0xFF283593)
              ),
              hintText: 'Libelle',
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

  Widget buildAuteur() {
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
            controller: auteurController,
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
              hintText: 'Auteur',
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

  Widget buildOuvrage() {
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
            controller: ouvrageController,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top:14),
              prefixIcon: Icon(
                Icons.bookmark,
                color: Color(0xFF283593)
              ),
              hintText: 'Type',
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
                var response = await connexion.addLivre(libelleController.value.text, auteurController.value.text, ouvrageController.value.text, false);
                //Navigator.pushNamed(context, EtudiantHome.routeName);
                print(response);
                //return;
                
                if (response == null) {
                   Toast.show("Le livre n'a pas été enregistré", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
                   return Navigator.pushNamed(context, AddLivre.routeName);
                }
                if (response != null) {
                  Toast.show("Le livre est enregistré avec succès!", context, duration: Toast.LENGTH_LONG , gravity:  Toast.CENTER);
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