import 'package:flutter/material.dart';

class Category {
  final int? id;
  final String name;
  final int color;
  final String? description;

  const Category({
    this.id,
    required this.name,
    required this.color,
    this.description,
  });

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'color': color, 'description': description};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      color: map['color'] as int,
      description: map['description'] as String,
    );
  }

  @override
  String toString() {
    return 'Category {id: $id, name: $name';
  }

  Category copyWith({String? name, String? description, int? color, int? id}) {
    return Category(
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      id: id ?? this.id,
    );
  }
}
