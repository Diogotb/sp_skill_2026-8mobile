class Game {
  final String id;
  final String title;
  final String description;
  final String genero;
  final String image;
  final double rating;
  final bool isFavorite;
  final bool inCollection;
  final List reviews;

  const Game({required this.id, required this.title, required this.description ,required this.genero, required this.image, required this.rating, required this.isFavorite, required this.reviews, required this.inCollection});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] ?? "",
      title: json['title'] ?? 'Título desconhecido',
      description: json['description'] ?? 'Sem descrição',
      genero: json['genero'] ?? 'Indefinido',
      image: json['image'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      isFavorite: json['isFavorite'] ?? false,
      inCollection: json['inCollection'] ?? false,
      reviews: json['reviews'] ?? [],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'genero': genero,
      'image': image,
      'rating': rating,
      'isFavorite': isFavorite,
      'inCollection': inCollection,
      "reviews": reviews,
    };
  }
}