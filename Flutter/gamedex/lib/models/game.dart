class Game {
  final String id;
  final String title;
  final String description;
  final String genero;
  final String image;
  final double rating;

  const Game({required this.id, required this.title, required this.description ,required this.genero, required this.image, required this.rating});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] ?? "",
      title: json['title'] ?? 'Título desconhecido',
      description: json['description'] ?? 'Sem descrição',
      genero: json['genero'] ?? 'Indefinido',
      image: json['image'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
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
    };
  }

  Game copyWith({
    String? id,
    String? title,
    String? description,
    String? genero,
    String? image,
    double? rating,
  }) {
    return Game(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      genero: genero ?? this.genero,
      image: image ?? this.image,
      rating: rating ?? this.rating
    );
  }
}