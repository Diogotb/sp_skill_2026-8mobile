import 'package:flutter/material.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/themes/theme_provider.dart';
import 'package:my_notes/views/add_note_page.dart';
import 'package:my_notes/widgets/custom_app_bar.dart';
import 'package:my_notes/widgets/custom_drawer.dart';
import 'package:my_notes/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

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
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotePage(categoryId: 1,),));
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
          ],
        ),
      ),
    );
  }
}
