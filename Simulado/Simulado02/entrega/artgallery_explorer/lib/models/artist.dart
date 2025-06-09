class Artist {
  int? id;
  final String name;
  final String birthDate;
  final String deathDate;
  final String nationality;
  final String period;
  final String biography;
  final String portraitUrl;

  Artist({
    this.id,
    required this.name,
    required this.birthDate,
    required this.deathDate,
    required this.nationality,
    required this.period,
    required this.biography,
    required this.portraitUrl,
  });

  Map<String, Object?> toMap(){
    return {
      'id':id,
      'name':name,
      'birthDate':birthDate,
      'deathDate':deathDate,
      'nationality':nationality,
      'period':period,
      'biography':biography,
      'portraitUrl':portraitUrl,
    };
  }

  factory Artist.fromMap(Map<String,dynamic> map){
    return Artist(
      id: map['id'] != null ? int.tryParse(map['id'].toString()) : null,
      name: map['name'] ?? '',
      birthDate: map['birthDate'] ?? '',
      deathDate: map['deathDate'] ?? '',
      nationality: map['nationality'] ?? '',
      period: map['period'] ?? '',
      biography: map['biography'] ?? '',
      portraitUrl: map['portraitUrl'] ?? '',
    );
  }
}
