import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_match/services/tab_service.dart';

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
  

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<Screen>(
        selectedColor: const Color.fromRGBO(0, 122, 255, 1),
        groupValue: navTabs.selectedSegment.value,
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
          navTabs.selectedSegment.value = value;
          Navigator.pushNamed(
              context, segmentScreens[navTabs.selectedSegment.value]!);
        });
  }
}
