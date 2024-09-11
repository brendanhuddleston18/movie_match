// https://api.flutter.dev/flutter/cupertino/showCupertinoModalPopup.html
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:movie_match/services/movie_service.dart';

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
        PullDownMenuHeader(
          leading: const Icon(CupertinoIcons.video_camera),
          title: "Pick a genre",
          onTap: () {},
        ),
        PullDownMenuItem.selectable(
            onTap: () {
              movies.filterMovie("action");
            },
            title: "Action"),
        PullDownMenuItem(onTap: () {}, title: "Comedy"),
        PullDownMenuItem(onTap: () {}, title: "Horror"),
        PullDownMenuItem(onTap: () {}, title: "Drama"),
        const PullDownMenuDivider.large(),
        PullDownMenuItem(
          onTap: () {},
          title: "Clear",
          itemTheme: const PullDownMenuItemTheme(
              textStyle: TextStyle(color: Colors.red)),
        )
      ],
      buttonBuilder: (context, showMenu) => CupertinoButton(
        onPressed: showMenu,
        padding: EdgeInsets.zero,
        child: const Icon(CupertinoIcons.slider_horizontal_3),
      ),
    );
  }
}
