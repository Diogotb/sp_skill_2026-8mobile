import 'package:flutter/material.dart';
import 'package:my_notes/controllers/note_controller.dart';
import 'package:my_notes/models/category_model.dart';
import 'package:my_notes/models/note_model.dart';
import 'package:my_notes/widgets/color_selector.dart';

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
  List<Note> _notes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    setState(() {
      _isLoading = true;
    });
    try {
      _notes = await _noteController.fetchNotesByCategory(widget.category.id!);
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
                  CustomBackButton(),
                  Text(
                    "Você pode clicar no que deseja editar",
                    textAlign: TextAlign.end,
                  ),
                ],
              ),

              SizedBox(height: 24),

              HeadingContainer(
                label: widget.category.name,
                color: Color(widget.category.color),
              ),

              SizedBox(height: 24),
              Text(
                widget.category.description!,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              Text("Cor", style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 24),
              ColorSelector(onColorSelected: (color) {}),
              SizedBox(height: 48),
              HeadingContainer(
                label: 'Minhas anotações',
                color: Color(widget.category.color),
              ),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    Note note = _notes[index];

                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Color(widget.category.color),
                        height: 107,
                        width: 130,
                        child: Column(children: [
                          Text(note.title),
                          Text(widget.category.name),
                          Icon(note.icon),
                          Text(note.date as String)
                        ]),
                      ),
                    );
                  },
                ),

            ],
          ),
        ),
      ),
    );
  }
}
