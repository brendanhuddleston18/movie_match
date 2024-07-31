
import 'package:flutter/material.dart';

import 'package:movie_match/helpers/constants.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 375,
        height: 650,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: PLACEHOLDER_SVG,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
