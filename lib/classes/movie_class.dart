class Movie {
  final String title;
  final String image;
  final String description;
  final List<String> cast;
  final double rating;

  Movie(
      {required this.title,
      required this.image,
      required this.description,
      required this.cast,
      required this.rating});

  static Movie fromJSON(dynamic data) {
    return Movie(
        title: data["Title"],
        image: data["Image"],
        description: data["Description"],
        cast: (data["Cast"] as List<dynamic>)
            .map((actor) => actor as String)
            .toList(),
        rating: data["Rating"] as double);
  }
}
