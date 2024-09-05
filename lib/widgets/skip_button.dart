import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SkipButtonWidget extends StatefulWidget {
  const SkipButtonWidget({super.key, required this.matchEngine});

  final MatchEngine matchEngine;

  @override
  State<SkipButtonWidget> createState() => _SkipButtonWidgetState();
}

class _SkipButtonWidgetState extends State<SkipButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: const ButtonStyle(iconSize: WidgetStatePropertyAll(94)),
        onPressed: () {
          widget.matchEngine.currentItem!.nope();
        },
        icon: const Icon(
            color: Color.fromRGBO(175, 50, 50, 1),
            CupertinoIcons.xmark_circle));
  }
}
