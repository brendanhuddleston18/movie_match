import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_match/widgets/swipe_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:movie_match/services/panel_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_match/widgets/panel.dart';

// TODO: Create Watchlist screen
// TODO: Implement API to fetch movies
// TODO: Create filter widget
// TODO: Finish designing panel so it looks pretty
// TODO: Adjust colors of home page
// TODO: Do I want the hamburger with different tiles(Profile, Watchlist, Settings etc.) or just a watchlist button
// TODO: Fix cupertino list section on watchlist

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      panel.hideMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.slider_horizontal_3)),
        middle: const Text(
          "Movie Match",
          style: TextStyle(fontSize: 22, color: Color.fromRGBO(0, 122, 255, 1)),
        ),
        trailing: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/watchlist');
            },
            icon: const Icon(CupertinoIcons.line_horizontal_3)),
      ),
      child: SlidingUpPanel(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          backdropEnabled: true,
          controller: panel.panelController.value,
          panel: const PanelWidget(),
          body: const SafeArea(
            minimum: EdgeInsets.only(top: 75),
            child: SwipeCardWidget(),
          )),
    );
  }
}
