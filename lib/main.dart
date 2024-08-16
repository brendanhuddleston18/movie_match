import 'package:flutter/cupertino.dart';
import 'package:movie_match/screens/home.dart';
import 'package:movie_match/services/movie_service.dart';

Future<Null> main() async {
  await movies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Movie Match',
      debugShowCheckedModeBanner: false,
      home: HomeWidget(),
    );
  }
}
