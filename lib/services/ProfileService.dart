import 'dart:async';
import 'package:flutter_formulario/models/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileService {

  Future<Usuario> obtenerUsuarios(String username) async {
    // ignore: prefer_typing_uninitialized_variables
    var parsed;
    var uri = Uri.parse("https://instagram-profile1.p.rapidapi.com/getprofile/$username");
    var response = await http.get(uri,headers: {
      'X-RapidAPI-Host': 'instagram-profile1.p.rapidapi.com',
      'X-RapidAPI-Key': 'e67235aea7mshea50885c207e043p1401b4jsn2afc108f841e'
    });

    if (response.statusCode == 200) {
      parsed = json.decode(response.body).cast<Map<String, dynamic>>();
     }else {
      throw Exception('Failed to load json data');
    }   

    Usuario usuarios = parsed.map<Usuario>((json) => Usuario.fromJson(json));

    return usuarios;
  }

  Future<Usuario> obtenerSearch(String username) async {
    // ignore: prefer_typing_uninitialized_variables
    var parsed;
    var uri = Uri.parse("https://instagram-profile1.p.rapidapi.com/searchuser/$username");
    var response = await http.get(uri,headers: {
      'X-RapidAPI-Host': 'instagram-profile1.p.rapidapi.com',
      'X-RapidAPI-Key': 'e67235aea7mshea50885c207e043p1401b4jsn2afc108f841e'
    });

    if (response.statusCode == 200) {
      parsed = json.decode(response.body).cast<Map<String, dynamic>>();
     }else {
      throw Exception('Failed to load json data');
    }   

    Usuario usuarios = parsed.map<Usuario>((json) => Usuario.fromJson(json));

    return usuarios;
  }

}