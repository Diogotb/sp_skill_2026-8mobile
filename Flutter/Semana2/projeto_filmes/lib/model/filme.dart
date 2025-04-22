class Filme {
  final int id;
  final String? posterPath;
  final String title;
  final String? releaseDate;
  final String? overview;
  final List<int> genreIds;

  const Filme({
    required this.id,
    this.posterPath,
    required this.title,
    this.releaseDate,
    this.overview,
    required this.genreIds,
  });

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String,
      releaseDate: json['release_date'] as String?,
      overview: json['overview'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>() ?? <int>[],
    );
  }
}

