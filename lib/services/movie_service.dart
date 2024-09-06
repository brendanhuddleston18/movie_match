import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_match/classes/movie_class.dart';
import 'package:movie_match/services/panel_service.dart';
import 'package:movie_match/services/database_service.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tmdb_api/tmdb_api.dart';

MovieService movies = Get.isRegistered<MovieService>()
    ? Get.find<MovieService>()
    : Get.put(MovieService());

class MovieService extends GetxService {
  final RxList<Movie> movieList = <Movie>[].obs;
  final RxList<SwipeItem> swipeList = <SwipeItem>[].obs;
  final Rx<MatchEngine?> matchEngine = Rxn<MatchEngine>();
  Rx<SwipeItem?> currentMovie = Rxn<SwipeItem?>();

  Future<void> init() async {
    await dotenv.load(fileName: '.env');
    String tmdbKey = dotenv.env['TMDB_KEY']!;
    String tmdbReadAccessToken = dotenv.env['TMDB_READ_ACCESS_TOKEN']!;
    final String response =
        await rootBundle.loadString("lib/assets/sample_movies.json");
    final data = json.decode(response);
    final tmdb = TMDB(ApiKeys(tmdbKey, tmdbReadAccessToken));
    Map result = await tmdb.v3.movies.getTopRated();
    print(result);

    addMoviesToList(result);
    addToSwipeList(movieList);
    matchEngine.value = MatchEngine(swipeItems: swipeList);
    currentMovie.value = matchEngine.value!.currentItem;
  }

  void addMoviesToList(dynamic data) {
    movieList.addAll((data["results"] as List<dynamic>)
        .map((movie) => Movie.fromJSON(movie)));
  }

  void addToSwipeList(List<Movie> movieList) {
    swipeList.addAll((movieList).map((movie) => SwipeItem(
        content: movie,
        likeAction: () {
          iterateValue();
          panel.hideMovie();
          database.addMovieToWatchlist(movie);
        },
        nopeAction: () {
          iterateValue();
          panel.hideMovie();
        })));
  }

  void iterateValue() {
    currentMovie.value = matchEngine.value!.nextItem;
  }
}
