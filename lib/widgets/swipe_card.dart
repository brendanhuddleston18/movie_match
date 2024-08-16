import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_match/services/movie_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:movie_match/widgets/movie_card.dart';
import 'package:movie_match/widgets/like_button.dart';
import 'package:movie_match/widgets/skip_button.dart';

class SwipeCardWidget extends StatefulWidget {
  const SwipeCardWidget({
    super.key,
    required this.panelController,
  });

  final PanelController panelController;

  @override
  State<SwipeCardWidget> createState() => _SwipeCardWidgetState();
}

class _SwipeCardWidgetState extends State<SwipeCardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SwipeCards(
            matchEngine: movies.matchEngine.value!,
            itemBuilder: (BuildContext context, int index) {
              return MovieCardWidget(
                movie: movies.movieList.toList()[index],
                panelController: widget.panelController,
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
                matchEngine: movies.matchEngine.value!,
              ),
              LikeButtonWidget(
                matchEngine: movies.matchEngine.value!,
              )
            ],
          ),
        ],
      );
    });
  }
}
