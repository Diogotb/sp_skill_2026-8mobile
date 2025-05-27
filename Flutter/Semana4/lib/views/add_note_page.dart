import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_notes/database/db_helper.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/widgets/custom_back_button.dart';
import 'package:my_notes/widgets/custom_small_button.dart';
import 'package:my_notes/widgets/icon_picker.dart';

import '../controllers/category_controller.dart';
import '../models/category_model.dart';
import '../themes/app_colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';

class AddNotePage extends StatefulWidget {
  int? categoryId;
  AddNotePage({super.key, this.categoryId});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final MyNotesDBHelper _dbHelper = MyNotesDBHelper();
  final TextEditingController _titleController = TextEditingController();
  final QuillController _quillController = QuillController.basic();

  IconData? _selectedIcon;

  final CategoryController _categoryController = CategoryController();

  List<Category> _categories = [];
  Category? _selectedCategory;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _categories = await _categoryController.fetchCategories();

      if (widget.categoryId != null && _selectedCategory == null) {
        _selectedCategory = _categories.firstWhere(
              (c) => c.id == widget.categoryId,
          orElse: () => _categories.first,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ocorreu um erro ao carregar categorias")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _selectCategory() async {
    final selected = await showDialog<Category>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Escolha uma categoria'),
          content: SizedBox(
            height: 200,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return ListTile(
                  title: Text(category.name),
                  trailing: _selectedCategory?.id == category.id
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    Navigator.pop(context, category);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        _selectedCategory = selected;
      });
    }
  }

  void _openIconPicker() {
    showDialog(
      context: context,
      builder: (context) {
        return IconPickerWidget(
          onIconSelected: (icon) {
            setState(() {
              _selectedIcon = icon;
            });
          },
        );
      },
    );
  }

  Future<void> _salvarNota() async {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("O título não pode estar vazio")),
      );
      return;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Escolha uma categoria")),
      );
      return;
    }

    final note = Note(
      title: _titleController.text.trim(),
      content: _quillController.document.toDelta().toJson().toString(),
      icon: _selectedIcon,
      categoryId: _selectedCategory!.id,
      date: DateTime.now(),
    );

    await _dbHelper.insertNote(note);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nota salva com sucesso!")),
    );

    Navigator.pop(context);
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBackButton(),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: Color(_selectedCategory!.color),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 100,
                    height: 45,
                    child: Text(_selectedCategory!.name, textAlign: TextAlign.center,),
                  ),
                  CustomSmallButton(
                    label: "Mudar Categoria",
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    onTap: _selectCategory,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: "Título",
                        labelStyle: Theme.of(context).textTheme.bodyLarge
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {
                    _openIconPicker();
                  }, icon:     _selectedIcon != null
                      ? Icon(_selectedIcon, size: 40)
                      : Icon(Icons.help_outline, size: 40),)
                ],
              ),
              QuillSimpleToolbar(
                controller: _quillController,
                config: QuillSimpleToolbarConfig(
                  multiRowsDisplay: false,
                  showBoldButton: true,
                  showItalicButton: true,
                  showUnderLineButton: false,
                  showStrikeThrough: false,
                  showInlineCode: false,
                  showHeaderStyle: false,
                  showListNumbers: true,
                  showListBullets: true,
                  showQuote: false,
                  showCodeBlock: false,
                  showIndent: false,
                  showLink: false,
                  showUndo: true,
                  showRedo: true,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: QuillEditor.basic(
                  controller: _quillController,
                  config: QuillEditorConfig(scrollable: true),
                ),
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.successLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        _salvarNota();
                      },
                      child: Text(
                        "Salvar",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.errorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancelar",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
