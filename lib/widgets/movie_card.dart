import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget(
      {super.key,
      required this.movie,
      required this.panelController,
      required this.sendMovieData});

  final dynamic movie;
  final PanelController panelController;
  final void Function(dynamic) sendMovieData;

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  bool isMovieShown = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 64,
      child: GestureDetector(
          onLongPress: () {
            widget.sendMovieData(widget.movie);
            widget.panelController.show();
          },
          child: SizedBox(
              width: 375,
              height: 550,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  widget.movie["Image"],
                  fit: BoxFit.fitWidth,
                ),
              ))),
    );
  }
}
