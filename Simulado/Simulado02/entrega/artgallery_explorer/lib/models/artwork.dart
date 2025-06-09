class Artwork{
  final int? id;
  final String title;
  final int artistId;
  final String year ;
  final String technique;
  final String dimensions;
  final String description;
  final String gallery;
  final String imageUrl;
  final bool isFeatured;

  const Artwork({this.id, required this.title, required this.artistId, required this.year, required this.technique, required this.dimensions, required this.description, required this.gallery, required this.imageUrl, required this.isFeatured});

  Map<String, Object?> toMap(){
    return {
      'id':id,
      'title':title,
      'artistId':artistId,
      'year':year,
      'technique': technique,
      'dimensions':dimensions,
      'description': description,
      'gallery':gallery,
      'imageUrl':imageUrl,
      'isFeatured':isFeatured
    };
  }

  factory Artwork.fromMap(Map<String,dynamic> map){
    return Artwork(
      id: map['id'] != null ? int.tryParse(map['id'].toString()) : null,
      title: map['title'] ?? '',
      artistId: int.tryParse(map['artistId'].toString()) ?? 0,
      year: map['year'] ?? '',
      technique: map['technique'] ?? '',
      dimensions: map['dimensions'] ?? '',
      description: map['description'] ?? '',
      gallery: map['gallery'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      isFeatured: map['isFeatured'].toString() == 'true',
    );
  }
}