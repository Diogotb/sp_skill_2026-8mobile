import 'package:flutter/material.dart';
import 'package:my_notes/controllers/note_controller.dart';
import 'package:my_notes/views/home_page.dart';

import '../controllers/category_controller.dart';
import '../models/category_model.dart';
import '../models/note_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/heading_container.dart';
import 'add_note_page.dart';

class CadernoPage extends StatefulWidget {
  const CadernoPage({super.key});

  @override
  State<CadernoPage> createState() => _CadernoPageState();
}

class _CadernoPageState extends State<CadernoPage> {
  final CategoryController _categoryController = CategoryController();
  final NoteController _noteController = NoteController();

  List<Category> _categories = [];
  List<Note> _notes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });
    try{
      _categories = await _categoryController.fetchCategories();
      _notes = await _noteController.fetchNotes();
    } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ocorreu um erro inesperado")));
    } finally{
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackButton(page: HomePage(),),

            SizedBox(height: 24,),

            HeadingContainer(label: "Minhas Anotações",),

            SizedBox(height: 24,),

            _isLoading ? Center(child: CircularProgressIndicator(),)
                : _notes.isEmpty ?
            Center(child: Text("Nenhuma nota por aqui", style: Theme.of(context).textTheme.headlineMedium,),)
                :
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75
              ),
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];

                final category = _categories.firstWhere(
                      (cat) => cat.id == note.categoryId,
                  orElse: () => Category(
                    id: 0,
                    name: 'Sem categoria',
                    color: 0xFFFFFFFF,
                  ),
                );

                return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                    color: Color(category.color),
                    height: 130,
                    width: 107,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(note.title),
                        Text(category.name),
                        if (note.icon != null) Icon(note.icon),
                        Text("${note.date.day}/${note.date.month}/${note.date.year}")
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNotePage(
                          noteId: note.id,
                          categoryId: category.id,
                        ),
                      ),
                    );
                  },
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}
