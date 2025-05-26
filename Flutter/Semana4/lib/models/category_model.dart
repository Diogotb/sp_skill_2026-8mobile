import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    required this.color,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color.toARGB32(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      color: Color(map['color'] as int),
    );
  }

  @override
  String toString() {
    return 'Category {id: $id, name: $name, color: ${color.toARGB32()}}';
  }
}
