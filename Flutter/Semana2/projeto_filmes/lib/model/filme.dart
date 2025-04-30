class Filme {
  final int id;
  final String? posterPath;
  final String title;
  final String? releaseDate;
  final String? overview;
  final List<int> genreIds;
  final List<Genre> genres;

  const Filme({
    required this.id,
    this.posterPath,
    required this.title,
    this.releaseDate,
    this.overview,
    required this.genreIds,
    required this.genres,
  });

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String,
      releaseDate: json['release_date'] as String?,
      overview: json['overview'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>() ?? <int>[],
      genres: (json['genres'] as List<dynamic>?)?.map((g) => Genre.fromJson(g as Map<String, dynamic>)).toList() ?? [],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}