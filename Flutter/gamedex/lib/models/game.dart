class Game {
  final int id;
  final String title;
  final String description;
  final String genero;
  final String image;
  final double rating;

  const Game({required this.id, required this.title, required this.description ,required this.genero, required this.image, required this.rating});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: int.parse(json['id']) ?? 0,
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
      'rating': rating
    };
  }
}