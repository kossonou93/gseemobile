import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://192.168.1.8:8080';
}

class ApiService {

  Future<dynamic> signIn(email, password) async {
    final response = await http.post('${URLS.BASE_URL}/api/user/signin', body:jsonEncode({
      'email': email,
      'password': password,
    }), headers:{'Content-type':'application/json'} );
    //print(response.statusCode);
    if (response.statusCode == 200) {
      //print(response.body);
      return json.decode(response.body);
    } 

    return response.statusCode;
  }

  Future<dynamic> addLivre(libelle, auteur, ouvrage, etat) async {
    final response = await http.post('${URLS.BASE_URL}/api/livre/add', body:jsonEncode({
      'libelle': libelle,
      'auteur': auteur,
      'ouvrage': ouvrage,
      'etat': etat,
    }), headers:{'Content-type':'application/json'} );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    }
    return response.statusCode;
  }

  Future<dynamic> addBiblio(nom, prenom, username, email, contact, password) async {
    final response = await http.post('${URLS.BASE_URL}/api/bibliotecaire/add', body:jsonEncode({
      'email': email,
      'password': password,
      'contact': contact,
      'nom': nom,
      'prenom': prenom,
      'username': username,
    }), headers:{'Content-type':'application/json'} );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } 

    return response.statusCode;
  }

  Future<dynamic> addEtudiant(nom, prenom, username, email, contact, password) async {
    final response = await http.post('${URLS.BASE_URL}/api/etudiant/add', body:jsonEncode({
      'email': email,
      'password': password,
      'contact': contact,
      'nom': nom,
      'prenom': prenom,
      'username': username,
    }), headers:{'Content-type':'application/json'} );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } 

    return response.statusCode;
  }

  Future<List> getSalle() async {
    final response = await http.get('${URLS.BASE_URL}/api/salle/getall');
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  Future<List> getOrdinateur() async {
    final response = await http.get('${URLS.BASE_URL}/api/ordinateur/getall');
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  Future<List> getVideoPro() async {
    final response = await http.get('${URLS.BASE_URL}/api/videoprojecteur/getall');
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  

  Future<dynamic> getReservationSalle(salle, debut, fin) async {
    final response = await http.post('${URLS.BASE_URL}/api/reservation/getreservationsalle', body:jsonEncode({
      'salle': salle,
      'debut': debut,
      'fin': fin
    }), headers:{'Content-type':'application/json'});
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  Future<dynamic> getReservationOrdinateur(ordinateur, debut, fin) async {
    final response = await http.post('${URLS.BASE_URL}/api/reservation/getreservationordinateur', body:jsonEncode({
      'ordinateur': ordinateur,
      'debut': debut,
      'fin': fin
    }), headers:{'Content-type':'application/json'});
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  Future<dynamic> getReservationVideoProjecteur(videoprojecteur, debut, fin) async {
    final response = await http.post('${URLS.BASE_URL}/api/reservation/getreservationvideoprojecteur', body:jsonEncode({
      'videoprojecteur': videoprojecteur,
      'debut': debut,
      'fin': fin
    }), headers:{'Content-type':'application/json'});
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  Future<dynamic> addReservationSalle(enseignant,salle, debut, fin) async {
    final response = await http.post('${URLS.BASE_URL}/api/reservation/addreservation/salle', body:jsonEncode({
      'enseignant': enseignant,
      'salle': salle,
      'debut': debut,
      'fin': fin
    }), headers:{'Content-type':'application/json'});
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      return json.decode(response.body);
    }
  }

  Future<dynamic> addReservationOrdinateur(enseignant,ordinateur, debut, fin) async {
    final response = await http.post('${URLS.BASE_URL}/api/reservation/addreservation/ordinateur', body:jsonEncode({
      'enseignant': enseignant,
      'ordinateur': ordinateur,
      'debut': debut,
      'fin': fin
    }), headers:{'Content-type':'application/json'});
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      print(json.decode(response.body));
      return json.decode(response.body);
    }
  }
}