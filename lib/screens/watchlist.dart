import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchlistWidget extends StatefulWidget {
  const WatchlistWidget({super.key});

  @override
  State<WatchlistWidget> createState() => _WatchlistWidgetState();
}

class _WatchlistWidgetState extends State<WatchlistWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.chevron_back)),
          middle: const Text(
            "Watchlist",
            style:
                TextStyle(fontSize: 22, color: Color.fromRGBO(0, 122, 255, 1)),
          ),
        ),
        child: CupertinoListSection(
          children: const [CupertinoListTile(title: Text("fuck"))],
        ));
  }
}
