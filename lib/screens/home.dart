import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_match/widgets/movie_card.dart';
import 'package:movie_match/widgets/like_button.dart';
import 'package:movie_match/widgets/skip_button.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
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
        child: const SafeArea(
          minimum: EdgeInsets.only(top: 125),
          child: Column(
            children: [
              Center(
                child: MovieCardWidget(
                  title: "Saving Private Ryan",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SkipButtonWidget(), LikeButtonWidget()],
              )
            ],
          ),
        ));
  }
}
