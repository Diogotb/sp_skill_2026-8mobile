import 'package:my_notes/database/db_helper.dart';
import 'package:my_notes/models/category_model.dart';
import 'package:my_notes/models/note_model.dart';

class CategoryController{
  final MyNotesDBHelper _dbHelper = MyNotesDBHelper();

  Future<int> addCategory(Category category) async{
    return await _dbHelper.insertCategory(category);
  }

  Future<List<Category>> fetchCategories() async{
    return await _dbHelper.getCategories();
  }

  Future<Category?> findCategoryById(int id) async{
    return await _dbHelper.getCategoryById(id);
  }

  Future<int> deleteCategory(int id) async{
    return await _dbHelper.deleteCategory(id);
  }
}