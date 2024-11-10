class Movie {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  String _removeHtmlTags(String input) {
    // Regular expression to remove <b> and <p> tags (and their content)
    String cleanString =
        input.replaceAll(RegExp(r'<(b|p)[^>]*>.*?</\1>', multiLine: true), '');
    return cleanString;
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["name"] ?? "",
      backDropPath: json["backdrop_path"] ?? "",
      originalTitle: json["original_title"] ?? "",
      overview: json["summary"] != null
          ? json["summary"]
          .replaceAll(RegExp(r'<(b|p)[^>]*>|</(b|p)>', multiLine: true), '')
          : "",
      posterPath: json["image"]?["medium"] ??
          "https://plus.unsplash.com/premium_photo-1710409625244-e9ed7e98f67b?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bW92aWUlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww",
      releaseDate: json["schedule"]["time"] ?? "" + json["schedule"]["days"][0],
      voteAverage: (json["rating"]["average"] != null)
          ? json["rating"]["average"].toDouble()
          : 0,
    );
  }
}
