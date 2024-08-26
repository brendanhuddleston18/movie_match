import 'package:flutter/cupertino.dart';
import 'package:movie_match/screens/home.dart';
import 'package:movie_match/screens/profile.dart';
import 'package:movie_match/screens/settings.dart';
import 'package:movie_match/services/movie_service.dart';
import 'package:movie_match/services/panel_service.dart';
import 'package:movie_match/screens/watchlist.dart';

Future<Null> main() async {
  await movies.init();
  await panel.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  final String initialRoute = "/";
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Movie Match',
      debugShowCheckedModeBanner: false,
      home: const HomeWidget(),
      theme: const CupertinoThemeData(
          barBackgroundColor: Color.fromRGBO(235, 237, 239, 1),
          scaffoldBackgroundColor: Color.fromRGBO(235, 237, 239, 1)),
      initialRoute: initialRoute,
      routes: {
        '/watchlist': (context) => const WatchlistWidget(),
        '/profile': (context) => const ProfileWidget(),
        '/settings': (context) => const SettingsWidget()
      },
    );
  }
}
