import 'package:uuid/uuid.dart';

class Movie {
  final String title;
  final String image;
  final String description;
  final List<String> cast;
  final double rating;
  final String id;

  Movie(
      {required this.title,
      required this.image,
      required this.description,
      required this.cast,
      required this.rating,
      required this.id});

  static Movie fromJSON(dynamic data) {
    var uuid = const Uuid();

    return Movie(
        id: uuid.v4(),
        title: data["title"],
        image: data["poster_path"],
        description: data["overview"],
        cast: ["actor 1", "actor 2", "actor 3"],
        // cast: (data["Cast"] as List<dynamic>)
        //     .map((actor) => actor as String)
        //     .toList(),
        rating: data["vote_average"] as double);
  }
}
