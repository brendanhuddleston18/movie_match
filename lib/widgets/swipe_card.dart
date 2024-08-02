import 'package:flutter/cupertino.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeCardWidget extends StatefulWidget {
  const SwipeCardWidget({super.key});

  @override
  State<SwipeCardWidget> createState() => _SwipeCardWidgetState();
}

class _SwipeCardWidgetState extends State<SwipeCardWidget> {

// TODO: Create List of swipe items
// TODO: Should I implement this in home.dart or in this file
// https://pub.dev/packages/swipe_cards

 final MatchEngine _matchEngine = MatchEngine(swipeItems: List<SwipeItem>);

  @override
  Widget build(BuildContext context) {
    return SwipeCards(
      matchEngine: _matchEngine,
      itemBuilder: (BuildContext context, int index) {},
      onStackFinished: () {},
      itemChanged: (SwipeItem item, int index) {},
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }
}
