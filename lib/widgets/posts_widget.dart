import 'package:flutter_formulario/shared/responsive.dart';
import 'package:flutter_formulario/utils/global.dart';
import 'package:flutter/material.dart';

class PostWidget  extends StatelessWidget {
  final String? urlImage;
  final String? userName;
  final String? caption;

  const PostWidget({
    Key? key,
    this.caption,
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
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Column(
                children: [
                  Image.network(urlImage!, height: 400,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.chat_bubble_outline_sharp, color: Colors.black, size: 35.0),
                          Icon(Icons.send_outlined, color: Colors.black, size: 35.0)
                        ],
                      ),
                      const Icon(Icons.save_alt_rounded, color: Colors.black, size: 35.0,)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(right: 10.0),
                        child: Text(userName!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      ),
                      Text(caption!, style: const TextStyle(color: Colors.black))
                    ],
                  )
                  
                ],
              )
            ) 
          )
        )
    );
  }
}
