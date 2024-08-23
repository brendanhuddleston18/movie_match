import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:flutter/cupertino.dart';

class HamburgerWidget extends StatefulWidget {
  const HamburgerWidget({super.key});

  @override
  State<HamburgerWidget> createState() => _HamburgerWidgetState();
}

class _HamburgerWidgetState extends State<HamburgerWidget> {
  @override
  Widget build(BuildContext context) {
    return PullDownButton(
      itemBuilder: (context) => [
        PullDownMenuHeader(
          leading: ColoredBox(
            color: CupertinoColors.systemBlue.resolveFrom(context),
          ),
          title: 'Profile',
          subtitle: 'Tap to open',
          onTap: () {},
          icon: CupertinoIcons.profile_circled,
        ),
        const PullDownMenuDivider.large(),
        PullDownMenuItem(
          title: 'Menu item',
          onTap: () {},
        ),
        PullDownMenuItem(
          title: 'Menu item 2',
          onTap: () {},
        ),
        const PullDownMenuDivider.large(),
        PullDownMenuItem(
          title: 'Sign out',
          onTap: () {},
          itemTheme: const PullDownMenuItemTheme(
              textStyle: TextStyle(color: Colors.red)),
        ),
      ],
      buttonBuilder: (context, showMenu) => CupertinoButton(
        onPressed: showMenu,
        padding: EdgeInsets.zero,
        child: const Icon(CupertinoIcons.line_horizontal_3),
      ),
    );
  }
}
