import 'package:flutter/material.dart';

class StoriesWidget extends StatelessWidget {
  final String? url;

  const StoriesWidget({
    Key? key,
    this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Padding(padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
    child:
      Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(url!,)
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 173, 2, 150),
            width: 3.0
          )
        )
      )
    );
  }
}