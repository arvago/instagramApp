import 'dart:async';
import 'package:flutter_formulario/models/search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileService {

  Future<List<Search>> obtenerSearch(String username) async {
    // ignore: prefer_typing_uninitialized_variables
    var parsed;
    var uri = Uri.parse("https://instagram-profile1.p.rapidapi.com/searchuser/$username");
    var response = await http.get(uri,headers: {
    'X-RapidAPI-Host': 'instagram-profile1.p.rapidapi.com',
    'X-RapidAPI-Key': '42655094ccmsh5f25f1526b8c440p1ab23djsn79c515fc2e7a'
  });

    if (response.statusCode == 200) {
      parsed = json.decode(response.body) as Map;
      parsed = parsed['result'];
     }else {
      throw Exception('Failed to load json data');
    }   

    List<Search> searchs = parsed.map<Search>((json) => Search.fromJson(json)).toList();
    return searchs;
  }

}