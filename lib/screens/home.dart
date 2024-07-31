import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.slider_horizontal_3)),
          middle: const Text(
            "Movie Match",
            style: TextStyle(fontSize: 22, color: Colors.blue),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.line_horizontal_3)),
        ),
        child: const Text("Movie cards go here"));
  }
}
