import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget(
      {super.key, required this.title, required this.imageURL});

  final String title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 375,
        height: 650,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            imageURL,
            fit: BoxFit.fill,
          ),
        ),
        // child: Stack(
        //   children: [
        //     ClipRRect(
        //       borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        //       child: Image.network(imageURL),
        //     ),
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       child: Text(
        //         title,
        //         style:
        //             const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
