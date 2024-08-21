import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({
    super.key,
    required this.matchEngine
  });

  final MatchEngine matchEngine;

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: const ButtonStyle(iconSize: WidgetStatePropertyAll(94)),
        onPressed: () {
          widget.matchEngine.currentItem!.like();
        },
        icon: const Icon(color: Colors.green, CupertinoIcons.heart_circle));
  }
}
