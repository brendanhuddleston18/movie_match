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
        title: data["Title"],
        image: data["Image"],
        description: data["Description"],
        cast: (data["Cast"] as List<dynamic>)
            .map((actor) => actor as String)
            .toList(),
        rating: data["Rating"] as double);
  }
}
