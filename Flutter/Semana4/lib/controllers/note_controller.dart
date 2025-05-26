import 'package:my_notes/database/db_helper.dart';
import 'package:my_notes/models/note_model.dart';

class NoteController{
  final MyNotesDBHelper _dbHelper = MyNotesDBHelper();

  Future<int> addNote(Note note) async{
    return await _dbHelper.insertNote(note);
  }

  Future<List<Note>> fetchNotes() async{
    return await _dbHelper.getNotes();
  }

  Future<Note?> findNoteById(int id) async{
    return await _dbHelper.getNoteById(id);
  }

  Future<int> deleteNote(int id) async{
    return await _dbHelper.deleteNote(id);
  }
}