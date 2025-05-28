import 'package:flutter/material.dart';
import 'package:my_notes/controllers/category_controller.dart';
import 'package:my_notes/controllers/note_controller.dart';
import 'package:my_notes/models/category_model.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/views/add_note_page.dart';
import 'package:my_notes/views/categories_page.dart';
import 'package:my_notes/widgets/color_selector.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/heading_container.dart';

class CategoryDetailsPage extends StatefulWidget {
  final Category category;
  const CategoryDetailsPage({super.key, required this.category});

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  final NoteController _noteController = NoteController();
  final CategoryController _categoryController = CategoryController();
  late Category _category;
  List<Note> _notes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _category = widget.category;
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    setState(() {
      _isLoading = true;
    });
    try {
      print(_category.id);
      _notes = await _noteController.fetchNotesByCategory(_category.id!);
      print(_notes);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Ocorreu um erro inesperado")));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteCategory() async {
    await _categoryController.deleteCategory(_category.id!);
    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesPage(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBackButton(page: CategoriesPage()),
                  Text(
                    "Você pode clicar no que deseja editar",
                    textAlign: TextAlign.end,
                  ),
                ],
              ),

              SizedBox(height: 24),

              GestureDetector(
                onTap:
                    () => _editFieldDialog(
                      title: 'Editar Título',
                      initialValue: _category.name,
                      onSaved: (value) async {
                        setState(() {
                          _category = _category.copyWith(name: value);
                        });
                        await _categoryController.updateCategory(_category);
                      },
                    ),
                child: HeadingContainer(
                  label: _category.name,
                  color: Color(_category.color),
                ),
              ),

              SizedBox(height: 24),
              GestureDetector(
                onTap:
                    () => _editFieldDialog(
                      title: 'Editar Descrição',
                      initialValue: _category.description ?? '',
                      onSaved: (value) async {
                        setState(() {
                          _category = _category.copyWith(description: value);
                        });
                        await _categoryController.updateCategory(_category);
                      },
                    ),
                child: Text(
                  (_category.description == null ||
                          _category.description?.trim() == '')
                      ? 'Sem descrição'
                      : _category.description!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 32),
              Text("Cor", style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 24),
              ColorSelector(
                onColorSelected: (color) async {
                  setState(() {
                    _category = _category.copyWith(color: color.toARGB32());
                  });
                  await _categoryController.updateCategory(_category);
                },
                selectedColor: Color(_category.color),
              ),
              SizedBox(height: 48),
              HeadingContainer(
                label: 'Minhas anotações',
                color: Color(_category.color),
              ),
              SizedBox(height: 24),

              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _notes.isEmpty
                  ? Center(
                    child: Text(
                      "Nenhuma nota por aqui",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )
                  : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      if (_notes.isNotEmpty) {
                        Note note = _notes[index];
                        print('Construindo nota: ${note.title}');
                        return _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 10,
                                ),
                                color: Color(_category.color),
                                height: 140,
                                width: 107,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 10,
                                  children: [
                                    Text(note.title),
                                    Text(_category.name),
                                    Icon(note.icon),
                                    Text(
                                      "${note.date.day}/${note.date.month}/${note.date.year}",
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => AddNotePage(
                                          noteId: note.id,
                                          categoryId: _category.id,
                                        ),
                                  ),
                                );
                              },
                            );
                      }
                    },
                  ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => _confirmDeleteDialog(),
            child: Icon(Icons.delete),
          ),
          FloatingActionButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNotePage(categoryId: _category.id),
                  ),
                ),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirmar exclusão'),
            content: Text('Tem certeza que deseja excluir esta categoria?'),
            actions: [
              TextButton(
                onPressed: () async{
                  _deleteCategory();
                },
                child: Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    await _categoryController.deleteCategory(_category.id!);
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro ao excluir a categoria')),
                    );
                  }
                },
                child: Text('Excluir'),
              ),
            ],
          ),
    );
  }

  void _editFieldDialog({
    required String title,
    required String initialValue,
    required void Function(String) onSaved,
  }) {
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(hintText: 'Digite aqui'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  onSaved(controller.text.trim());
                  Navigator.pop(context);
                },
                child: Text('Salvar'),
              ),
            ],
          ),
    );
  }
}

