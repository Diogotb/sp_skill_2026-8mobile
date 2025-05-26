import 'package:flutter/material.dart';
import 'package:my_notes/models/category_model.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyNotesDBHelper {
  static Database? _database;
  static final MyNotesDBHelper _instance = MyNotesDBHelper._internal();

  MyNotesDBHelper._internal();
  factory MyNotesDBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final _dbPath = await getDatabasesPath();
    final path = join(_dbPath, 'mynotes.db');

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''

    CREATE TABLE categories(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    color INTEGER,
    )
    
    CREATE TABLE notes (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title TEXT, 
    icon_code_point INTEGER, 
    icon_font_family TEXT, 
    date INTEGER, 
    content TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
    );
    ''');
    print("Banco criado");

    await db.insert('categories', {
      'name': 'Notas Rápidas',
      'color': Colors.lightBlue.value,
    });
  }

  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return maps.map((e) => Note.fromMap(e)).toList();
  }

  Future<Note?> getNoteById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'id=?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int>deleteNote(int id) async {
    final db = await database;
    return await db.delete('notes', where: 'id=?', whereArgs: [id]);
  }

  Future<int>insertCategory(Category category) async {
    final db = await database;
    return await db.insert('categories', category.toMap());
  }

  Future<List<Category>> getCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return maps.map((e) => Category.fromMap(e)).toList();
  }

  Future<Category?> getCategoryById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'categories',
      where: 'id=?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Category.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int>deleteCategory(int id) async {
    final db = await database;
    return await db.delete('categories', where: 'id=?', whereArgs: [id]);
  }
}
