import 'package:movie_match/classes/movie_class.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

DatabaseService database = Get.isRegistered<DatabaseService>()
    ? Get.find<DatabaseService>()
    : Get.put(DatabaseService());

class DatabaseService extends GetxService {
  late SupabaseClient supabase;
  Future<void> init() async {
    await dotenv.load(fileName: '.env');
    String url = dotenv.env['URL']!;
    String anonKey = dotenv.env['ANONKEY']!;

    await Supabase.initialize(url: url, anonKey: anonKey);
    supabase = Supabase.instance.client;
  }

  Future<List<Map>> getWatchlist() async {
    final data = await supabase.from('watchlist').select('*');
    return data;
  }

  Future<void> addMovieToWatchlist(Movie movie) async {
    await supabase.from('watchlist').insert({
      'id': movie.id,
      'name': movie.title,
      'image': movie.image,
      'description': movie.description,
      'movie_cast': movie.cast,
      'rating': movie.rating
    });
  }

  // TODO: Make a delete movie from watchlist function
}
