import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_match/services/movie_service.dart';
import 'package:movie_match/widgets/swipe_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PanelController panelController = PanelController();

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
      child: SlidingUpPanel(
          backdropEnabled: true,
          controller: panelController,
          panel: Obx(() =>
              Text((movies.currentMovie.value!.content.title) ?? "empty")),
          body: SafeArea(
            minimum: const EdgeInsets.only(top: 125),
            child: SwipeCardWidget(
              panelController: panelController,
            ),
          )),
    );
  }
}
