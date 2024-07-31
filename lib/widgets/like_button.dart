import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({super.key});

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: const ButtonStyle(iconSize: WidgetStatePropertyAll(94)),
        onPressed: () {},
        icon: const Icon(color: Colors.green, CupertinoIcons.heart_circle));
  }
}
