import 'package:flutter/cupertino.dart';
import 'package:movie_match/widgets/filter_widget.dart';
import 'package:movie_match/widgets/swipe_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:movie_match/services/panel_service.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_match/widgets/panel.dart';
import 'package:movie_match/widgets/hamburger.dart';
import 'package:movie_match/widgets/nav_slide.dart';

//  TODO: Randomize movie generation
// https://www.themoviedb.org/talk/5dc1e248f1b5710015eb016f

// TODO: Finish designing panel so it looks pretty

// TODO: Adjust colors of home page

// TODO: Fix cupertino list section on watchlist

// TODO: Skip and like buttons look out of place

// TODO: Implement tabbed navbar to switch between cards and watchlist???
// https://api.flutter.dev/flutter/cupertino/CupertinoSegmentedControl-class.html?_gl=1*5tzef0*_ga*NTE5MDUzMTA4LjE3MjY4NjkxMDQ.*_ga_04YGWK0175*MTcyNjg2OTEwMy4xLjEuMTcyNjg2OTE1Mi4wLjAuMA..
// TODO: Get the pages in sync with switch

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
      navigationBar: const CupertinoNavigationBar(
        leading: FilterWidget(),
        middle: NavScrollWidget(),
        trailing: HamburgerWidget(),
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
