import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_match/widgets/movie_card.dart';
import 'package:movie_match/widgets/like_button.dart';
import 'package:movie_match/widgets/skip_button.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int movieIndex = 0;
  List movieList = [];
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("lib/assets/sample_movies.json");
    final data = await json.decode(response);
    setState(() {
      movieList = data["movies"];
    });
  }

  void incrementIndex() {
    if (movieIndex < 2) {
      movieIndex++;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.slider_horizontal_3)),
          middle: const Text(
            "Movie Match",
            style: TextStyle(fontSize: 22, color: Colors.blue),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.line_horizontal_3)),
        ),
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 125),
          child: Column(
            children: [
              Center(
                child: MovieCardWidget(
                  title: movieList[movieIndex]["Title"],
                  imageURL: movieList[movieIndex]["Image"],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SkipButtonWidget(
                    incrementIndex: incrementIndex,
                  ),
                  LikeButtonWidget(
                    incrementIndex: incrementIndex,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
