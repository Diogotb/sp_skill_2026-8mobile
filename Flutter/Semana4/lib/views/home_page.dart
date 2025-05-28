import 'package:flutter/material.dart';
import 'package:my_notes/controllers/category_controller.dart';
import 'package:my_notes/controllers/note_controller.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/themes/theme_provider.dart';
import 'package:my_notes/views/add_note_page.dart';
import 'package:my_notes/widgets/custom_app_bar.dart';
import 'package:my_notes/widgets/custom_container.dart';
import 'package:my_notes/widgets/custom_drawer.dart';
import 'package:my_notes/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoryController _categoryController = CategoryController();
  final NoteController _noteController = NoteController();
  List<Category> _categories = [];
  List<Note> _recentNotes = [];
  bool _isLoading = true;

  Future<void> _loadRecentNotes() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _categories = await _categoryController.fetchCategories();
      _recentNotes = await _noteController.fetchMostRecent();
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadRecentNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 48),
            SizedBox(
              height: 114,
              width: 355,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNotePage(categoryId: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Nota Rápida",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),

            SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomIconButton(
                  size: 150,
                  icon: Icons.book,
                  label: "Caderno",
                  onTap: () {
                    Navigator.pushNamed(context, '/caderno');
                  },
                ),

                CustomIconButton(
                  size: 150,
                  icon: Icons.category,
                  label: 'Categorias',
                  onTap: () {
                    Navigator.pushNamed(context, '/categories');
                  },
                ),
              ],
            ),
            SizedBox(height: 32),

            CustomContainer(
              padding: 5,
              width: 355,
              height: 400,
              child: Column(
                children: [
                  Text(
                    "Recentes",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),

                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _recentNotes.isEmpty
                      ? Text("Nenhuma nota recente")
                      : SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: _recentNotes.length,
                          itemBuilder: (context, index) {
                            final note = _recentNotes[index];
                            final category = _categories.firstWhere(
                              (cat) => cat.id == note.categoryId,
                              orElse:
                                  () => Category(
                                    id: 0,
                                    name: 'Sem categoria',
                                    color: 0xFFE0E0E0,
                                  ),
                            );

                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(noteId: note.id, categoryId: category.id,),));
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 6),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(category.color),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      note.icon,
                                      size: 28,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            note.title,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '${note.date.day.toString().padLeft(2, '0')}/'
                                            '${note.date.month.toString().padLeft(2, '0')}/'
                                            '${note.date.year}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
