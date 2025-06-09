class Exhibition {
  final int id;
  final String title;
  final String gallery;
  final String startDate;
  final String endDate;
  final String status;
  final String description;
  final String bannerUrl;
  final List<int> artworkIds;

  const Exhibition({
    required this.id,
    required this.title,
    required this.gallery,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.description,
    required this.bannerUrl,
    required this.artworkIds,
  });

  factory Exhibition.fromMap(Map<String, dynamic> map) {
    return Exhibition(
      id: int.tryParse(map['id'].toString()) ?? 0,
      title: map['title'] ?? '',
      gallery: map['gallery'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      status: map['status'] ?? '',
      description: map['description'] ?? '',
      bannerUrl: map['bannerUrl'] ?? '',
      artworkIds: (map['artworkIds'] as List<dynamic>?)
          ?.map((id) => int.tryParse(id.toString()) ?? 0)
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'gallery': gallery,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
      'description': description,
      'bannerUrl': bannerUrl,
      'artworkIds': artworkIds,
    };
  }
}
