import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({super.key});

  @override
  State<MoreInfoWidget> createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: const Icon(CupertinoIcons.info_circle));
  }
}
