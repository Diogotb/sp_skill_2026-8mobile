import 'package:flutter/material.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/views/add_note_page.dart';
import 'package:my_notes/views/home_page.dart';
import 'package:my_notes/widgets/custom_drawer_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            width: 70,
            child: Text(
              'MyNotes',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(endIndent: 20, indent: 20),
          SizedBox(height: 24),
          CustomDrawerButton(
            label: "Nota Rápida",
            icon: Icons.note_add,
            color: AppColors.accent,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(categoryId: 1),));
            },
          ),
          SizedBox(height: 40),
          CustomDrawerButton(
            label: "Início",
            icon: Icons.home,
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),

          SizedBox(height: 40),
          CustomDrawerButton(
            label: "Meu Caderno",
            icon: Icons.book,
            onTap: () {
              Navigator.pushNamed(context, '/caderno');
            },
          ),
          SizedBox(height: 40),
          CustomDrawerButton(
            label: "Categorias",
            icon: Icons.category,
            onTap: () {
              Navigator.pushNamed(context, '/categories');
            },
          ),
          SizedBox(height: 40),
          CustomDrawerButton(
            label: "Configurações",
            icon: Icons.settings,
            onTap: () {
              Navigator.pushNamed(context, '/config');
            },
          ),
        ],
      ),
    );
  }
}
