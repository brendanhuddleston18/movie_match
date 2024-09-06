import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_match/widgets/swipe_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:movie_match/services/panel_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_match/widgets/panel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_match/widgets/hamburger.dart';

//  TODO: Randomize movie generation
// https://www.themoviedb.org/talk/5dc1e248f1b5710015eb016f

// TODO: Create filter widget

// TODO: Finish designing panel so it looks pretty

// TODO: Adjust colors of home page

// TODO: Fix cupertino list section on watchlist

// TODO: Skip and like buttons look out of place

// TODO: Implement tabbed navbar to switch between cards and watchlist???

// TODO: Stylize Watchlist tiles, Drag and drop???

// TODO: Create Profile/Implement Single Sign On

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
        middle: Text(
          "Movie Match",
          style: GoogleFonts.dancingScript(
              textStyle: const TextStyle(
                  fontSize: 28, color: Color.fromRGBO(0, 122, 255, 1))),
        ),
        trailing: const HamburgerWidget(),
      ),
      child: SlidingUpPanel(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          backdropEnabled: true,
          controller: panel.panelController.value,
          panel: const PanelWidget(),
          body: const SafeArea(
            minimum: EdgeInsets.only(top: 65),
            child: SwipeCardWidget(),
          )),
    );
  }
}
