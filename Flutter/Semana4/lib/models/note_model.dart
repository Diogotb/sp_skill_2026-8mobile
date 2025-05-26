import 'package:flutter/material.dart';

class Note{
  final int id;
  final String title;
  final IconData? icon;
  final DateTime date;
  final String content;

  const Note({required this.id,required this.title, required this.icon, required this.date, required this.content});

  Map<String, Object?> toMap(){
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'date': date,
      'content': content,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Note {id: $id, title: $title, date: $date }';
  }

  static Future<List<Note>> fromMap(Map<String, dynamic> e) {}
}