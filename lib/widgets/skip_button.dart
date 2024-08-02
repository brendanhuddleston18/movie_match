import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkipButtonWidget extends StatefulWidget {
  const SkipButtonWidget({super.key, required this.incrementIndex});

  final void Function() incrementIndex;

  @override
  State<SkipButtonWidget> createState() => _SkipButtonWidgetState();
}

class _SkipButtonWidgetState extends State<SkipButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: const ButtonStyle(iconSize: WidgetStatePropertyAll(94)),
        onPressed: () {
          widget.incrementIndex();
        },
        icon: const Icon(color: Colors.red, CupertinoIcons.xmark_circle));
  }
}
