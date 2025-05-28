import 'package:flutter/material.dart';

class Note{
  final int? id;
  final String title;
  final IconData? icon;
  final DateTime date;
  final String content;
  final int? categoryId;
  final DateTime? lastAccessed;

  const Note({this.id,required this.title, required this.icon, required this.date, required this.content, this.categoryId, this.lastAccessed});

  Map<String, Object?> toMap(){
    return {
      'id': id,
      'title': title,
      'icon_code_point': icon?.codePoint,
      'icon_font_family': icon?.fontFamily,
      'date': date.millisecondsSinceEpoch,
      'content': content,
      'category_id': categoryId,
      'last_accessed': lastAccessed?.millisecondsSinceEpoch,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Note {id: $id, title: $title, date: $date }';
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    IconData? iconData;
    final iconCodePoint = map['icon_code_point'] as int?;
    final iconFontFamily = map['icon_font_family'] as String?;
    if (iconCodePoint != null) {
      iconData = IconData(iconCodePoint, fontFamily: iconFontFamily);
    }

    final dateTime =
    DateTime.fromMillisecondsSinceEpoch(map['date'] as int);

    final lastAccessed = map['last_accessed'] != null
        ? DateTime.fromMillisecondsSinceEpoch(map['last_accessed'] as int)
        : null;


    return Note(
      id: map['id'] as int,
      title: map['title'] as String,
      icon: iconData,
      date: dateTime,
      content: map['content'] as String,
      categoryId: map['category_id'] as int,
      lastAccessed: lastAccessed,
    );
  }

}