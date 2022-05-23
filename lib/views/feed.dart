import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_formulario/services/ProfileService.dart';
import 'package:flutter_formulario/widgets/posts_widget.dart';

//import 'package:animate_do/animate_do.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key, this.userLoggedd}) : super(key: key);
  final String? userLoggedd;

  @override
  State<Feed> createState() => _Feed(userLogged: userLoggedd);
}

class _Feed extends State<Feed> {
  _Feed({this.userLogged});
  var datos;
  var listaFotos;
  final String? userLogged;
  ProfileService profileService = ProfileService();

  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    obtenerUsuarioLog(userLogged!).then((data){
        setState(() {
          datos = data;
          listaFotos = datos['lastMedia']['media'];
        });
      }
    );

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          backgroundColor: Colors.white,
          elevation: 0.6,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userLogged!, style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black)),
              Padding(padding: const EdgeInsets.only(right: 5),
                child: Row(
                  children: const [
                    Icon(Icons.add_circle_outline_sharp, size: 35.0, color: Colors.black),
                    Icon(Icons.menu, size: 35.0, color: Colors.black)
                  ],
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15,15, 8),
                  child: Column(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(datos['profile_pic_url']!)
                          ),
                        )
                      ),
                      Text(datos['full_name'], style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.fromLTRB(30, 8, 8, 8),
                child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(datos['lastMedia']['count'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Text("Posts"),      
                          ],
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(datos['followers'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Text("Seguidores"),      
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(datos['following'].toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Text("Siguiendo"),      
                          ],
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),Expanded(
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    for ( var i in listaFotos ) PostWidget(urlImage: i['display_url'], caption: i['caption'], userName: datos['username'],)
                  ],
              )   
            )
          ],
        )
    );
  }

  Future<dynamic> obtenerUsuarioLog(String username) async {
    // ignore: prefer_typing_uninitialized_variables
    var parsed;
    var uri = Uri.parse("https://instagram-profile1.p.rapidapi.com/getprofile/$username");
    var response = await http.get(uri,headers: {
    'X-RapidAPI-Host': 'instagram-profile1.p.rapidapi.com',
    'X-RapidAPI-Key': '42655094ccmsh5f25f1526b8c440p1ab23djsn79c515fc2e7a'
  });

    if (response.statusCode == 200) {
      parsed = json.decode(response.body);
     }else {
      throw Exception('Failed to load json data');
    }   

    return parsed;
  }
    
}
