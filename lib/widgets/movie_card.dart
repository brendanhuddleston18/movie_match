import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          children: [PLACEHOLDER_SVG, Text(title)],
        ),
      ),
    );
  }
}
