class Filme {
  final String id;
  final String title;
  final String posterUrl;
  final double rating;
  final String duration;
  final List genres;
  final String overview;
  final String trailerUrl;
  final bool isNowPlaying;
  final bool isPopular;

  const Filme({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.duration,
    required this.genres,
    required this.overview,
    required this.trailerUrl,
    required this.isNowPlaying,
    required this.isPopular,
  });

  factory Filme.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'title': String title,
        'posterUrl': String posterUrl,
        'rating': double rating,
        'duration': String duration,
        'genres': List genres,
        'overview': String overview,
        'trailerUrl': String trailerUrl,
        'isNowPlaying': bool isNowPlaying,
        'isPopular': bool isPopular,
      } =>
        Filme(
          id: id,
          title: title,
          posterUrl: posterUrl,
          rating: rating,
          duration: duration,
          genres: genres,
          overview: overview,
          trailerUrl: trailerUrl,
          isNowPlaying: isNowPlaying,
          isPopular: isPopular,
        ),
      _ => throw const FormatException('Falha ao carregar filme'),
    };
  }
}
