import 'package:flutter_formulario/shared/responsive.dart';
import 'package:flutter_formulario/utils/global.dart';
import 'package:flutter/material.dart';

class SearchWidget  extends StatelessWidget {
  final String? urlImage;
  final String? userName;
  final String? name;

  const SearchWidget({
    Key? key,
    this.name,
    this.urlImage,
    this.userName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
      child:
        InkWell(
          child: Card(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(urlImage!)
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userName!, 
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(name!)
                      ]
                    ),
                  )                              
                ]
              ),
            ) 
          )
        )
    );
  }
}
