import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

enum Screen { home, watchlist }

Map<Screen, String> segmentScreens = {
  Screen.home: '/home',
  Screen.watchlist: '/watchlist'
};

class NavScrollWidget extends StatefulWidget {
  const NavScrollWidget({super.key});

  @override
  State<NavScrollWidget> createState() => _NavScrollWidgetState();
}

class _NavScrollWidgetState extends State<NavScrollWidget> {
  Screen selectedSegment = Screen.home;

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<Screen>(
        selectedColor: const Color.fromRGBO(0, 122, 255, 1),
        groupValue: selectedSegment,
        children: <Screen, Widget>{
          Screen.home: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Movie Match",
              style: GoogleFonts.dancingScript(),
            ),
          ),
          Screen.watchlist: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Watchlist',
              style: GoogleFonts.dancingScript(),
            ),
          ),
        },
        onValueChanged: (Screen value) {
          setState(() {
            selectedSegment = value;
            Navigator.pushNamed(context, segmentScreens[selectedSegment]!);
          });
        });
  }
}
