// https://api.flutter.dev/flutter/cupertino/showCupertinoModalPopup.html

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_down_button/pull_down_button.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return PullDownButton(
      itemBuilder: (context) => [
        const PullDownMenuHeader(
          title: "Pick a genre",
        ),
        PullDownMenuItem(onTap: () {}, title: "title"),
      ],
      buttonBuilder: (context, showMenu) => CupertinoButton(
        onPressed: showMenu,
        padding: EdgeInsets.zero,
        child: const Icon(CupertinoIcons.slider_horizontal_3),
      ),
    );
  }
}
