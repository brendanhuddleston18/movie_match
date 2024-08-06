import 'package:flutter/cupertino.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:movie_match/widgets/movie_card.dart';
import 'package:movie_match/widgets/like_button.dart';
import 'package:movie_match/widgets/skip_button.dart';

class SwipeCardWidget extends StatefulWidget {
  const SwipeCardWidget({
    super.key,
    required this.swipeList,
  });

  final List<SwipeItem> swipeList;

  @override
  State<SwipeCardWidget> createState() => _SwipeCardWidgetState();
}

class _SwipeCardWidgetState extends State<SwipeCardWidget> {
// https://pub.dev/packages/swipe_cards

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MatchEngine matchEngine = MatchEngine(swipeItems: widget.swipeList);
    return Column(children: [
      SwipeCards(
        matchEngine: matchEngine,
        itemBuilder: (BuildContext context, int index) {
          final movie = widget.swipeList[index].content;
          return MovieCardWidget(
            movie: movie,
          );
        },
        onStackFinished: () {},
        itemChanged: (SwipeItem item, int index) {},
        upSwipeAllowed: false,
        fillSpace: false,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SkipButtonWidget(
            matchEngine: matchEngine,
          ),
          LikeButtonWidget(
            matchEngine: matchEngine,
          )
        ],
      )
    ]);
  }
}
