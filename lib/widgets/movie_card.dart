import 'package:flutter/material.dart';
import 'package:movie_match/widgets/more_info.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key, required this.movie});

  final dynamic movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 64,
      child: SizedBox(
          width: 375,
          height: 550,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              movie["Image"],
              fit: BoxFit.fitWidth,
            ),
          )),
    );
  }
}
