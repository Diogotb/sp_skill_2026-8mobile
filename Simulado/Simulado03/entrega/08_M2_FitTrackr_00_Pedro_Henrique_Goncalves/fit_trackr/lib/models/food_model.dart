class Food {
  final String id;
  final String name;
  final double caloriesPerUnit;
  final String unit;

  Food({
    required this.id,
    required this.name,
    required this.caloriesPerUnit,
    required this.unit,
  });

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'],
      name: map['name'],
      caloriesPerUnit: map['caloriesPerUnit']?.toDouble() ?? 0.0,
      unit: map['unit'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'caloriesPerUnit': caloriesPerUnit,
      'unit': unit,
    };
  }
}