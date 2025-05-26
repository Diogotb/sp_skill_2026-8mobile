import 'package:flutter/material.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/widgets/custom_app_bar.dart';
import 'package:my_notes/widgets/custom_back_button.dart';
import 'package:my_notes/widgets/custom_drawer.dart';
import 'package:my_notes/widgets/heading_container.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
            CustomBackButton(),

            SizedBox(height: 24,),

            HeadingContainer(label: "Categorias",),

            SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}
