import 'package:flutter/material.dart';
import 'package:my_notes/database/db_helper.dart';
import 'package:my_notes/models/category_model.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/views/categories_page.dart';
import 'package:my_notes/widgets/color_selector.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/heading_container.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final MyNotesDBHelper _dbHelper = MyNotesDBHelper();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color? selectedColor;

  Future<void> _salvarCategoria() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newCategory = Category(
        name: _titleController.text,
        description: _descriptionController.text,
        color: selectedColor!.toARGB32(),
      );

      await _dbHelper.insertCategory(newCategory);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoriesPage()),
      );
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
            SizedBox(height: 24),

            HeadingContainer(label: "Adicionar Categoria"),

            SizedBox(height: 48),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    validator:
                        (value) =>
                            value!.isEmpty ? "Campo não preenchido!" : null,
                  ),

                  SizedBox(height: 80),

                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Breve Descrição',
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    validator:
                        (value) =>
                            value!.length > 40
                                ? "Descrição muito extensa!"
                                : null,
                  ),

                  SizedBox(height: 64),
                  Text("Cor", style: Theme.of(context).textTheme.headlineLarge),
                  SizedBox(height: 12),
                  ColorSelector(
                    selectedColor: selectedColor,
                    onColorSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),

                  SizedBox(height: 100),
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
                            _salvarCategoria();
                          },
                          child: Text(
                            "Salvar",
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(color: Colors.white),
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
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
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
