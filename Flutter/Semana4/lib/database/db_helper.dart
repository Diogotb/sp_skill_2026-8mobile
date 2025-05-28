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
      description TEXT
    );
  ''');

    await db.execute('''
    CREATE TABLE notes (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      title TEXT, 
      icon_code_point INTEGER, 
      icon_font_family TEXT, 
      date INTEGER, 
      content TEXT,
      category_id INTEGER,
      last_accessed INTEGER,
      FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
    );
  ''');
    print("Banco criado");

    await db.insert('categories', {
      'name': 'Notas Rápidas',
      'color': Colors.purple[200]?.toARGB32(),
      'description': 'Para anotações rápidas sem uma categoria exata!'
    });

    print("Categoria default criada");
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

  Future<List<Note>> getNotesByCategory(int categoryId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );
    print("Retornando lista com Notas");
    print(maps);
    if(maps.isNotEmpty) {
      return maps.map((e) => Note.fromMap(e)).toList();
    } else {
      print('Nenhuma nota encontrada');
      return [];
    }
  }

  Future<int> updateCategory(Category category) async {
    final db = await database;

    return await db.update(
      'categories',
      category.toMap(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> updateNote(Note note) async {
    final db = await database;

    print("Atualizando a nota ${note.id}");
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> updateNoteLastAccessed(int id, DateTime timestamp) async {
    final db = await database;

    await db.update(
      'notes',
      {
        'last_accessed': timestamp.millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Note>> getRecentNotes({int limit =5}) async{
    final db = await database;
    final maps = await db.query(
      'notes',
      orderBy: 'last_accessed DESC',
      limit: limit,
    );

    return List.generate(maps.length, (i){
      return Note.fromMap(maps[i]);
    });
  }

}
