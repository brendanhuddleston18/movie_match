import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_match/widgets/swipe_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:get/get.dart';

// TODO: Implement GETX inorder to update variables without full view changing
// https://pub.dev/packages/get

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int movieIndex = 0;
  List movieList = [];
  List<SwipeItem> swipeList = [];
  dynamic currentMovie = {"Title": ""};
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("lib/assets/sample_movies.json");
    final data = await json.decode(response);
    setState(() {
      print('reading JSON');
      movieList = data["movies"];
      for (final (index, movie) in movieList.indexed) {
        swipeList.add(SwipeItem(
            content: movie,
            likeAction: () {
              // TODO: Create watchlist
              // TODO: Add movie to "watchlist"
            },
            nopeAction: () {
              print(index);
              swipeList.remove(swipeList[index - 1]);
              // print(swipeList[index].content);
            }));
      }
    });
  }

  void sendMovieData(dynamic movie) {
    setState(() {
      currentMovie = movie;
    });
  }

  PanelController panelController = PanelController();

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) => panelController.hide(),
    // );

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
      child: SlidingUpPanel(
          backdropEnabled: true,
          controller: panelController,
          panel: Text(currentMovie["Title"]),
          body: SafeArea(
            minimum: const EdgeInsets.only(top: 125),
            child: SwipeCardWidget(
              sendMovieData: sendMovieData,
              swipeList: swipeList,
              panelController: panelController,
            ),
          )),
    );
  }
}
