import 'package:flutter/material.dart';

class Note{
  final int id;
  final String title;
  final IconData? icon;
  final DateTime date;
  final String content;
  final int? categoryId;

  const Note({required this.id,required this.title, required this.icon, required this.date, required this.content, this.categoryId});

  Map<String, Object?> toMap(){
    return {
      'id': id,
      'title': title,
      'icon_code_point': icon?.codePoint,
      'icon_font_family': icon?.fontFamily,
      'date': date.millisecondsSinceEpoch,
      'content': content,
      'categoryId': categoryId,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Note {id: $id, title: $title, date: $date }';
  }

  factory Note.fromMap(Map<String,dynamic> map){

    IconData? iconData;
    if(map['icon_code_point'] != null){
      iconData = IconData(map['icon_code_point'] as int, fontFamily: map['icon_font_family' as String?]);
    }

    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(map['date' as int]);

    return Note(
      id: map['id'] as int,
      title: map['title'] as String,
      icon: iconData,
      date: dateTime,
      content: ['content'] as String,
      categoryId: ['categoryId'] as int,
    );
  }
}