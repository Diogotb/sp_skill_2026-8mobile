import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class IconPickerWidget extends StatelessWidget {
  final List<IconData> icons;
  final ValueChanged<IconData> onIconSelected;
  final int crossAxisCount;
  final double iconSize;
  final String title;

  const IconPickerWidget({
    super.key,
    required this.onIconSelected,
    this.icons = const [
      Icons.star,
      Icons.favorite,
      Icons.work,
      Icons.home,
      Icons.school,
      Icons.flight,
      Icons.book,
      Icons.music_note,
      Icons.check,
      Icons.pets,
      Icons.cake,
      Icons.local_cafe,
      Icons.lightbulb,
      Icons.shopping_cart,
      Icons.sports_esports,
      Icons.phone,
      Icons.email,
    ],
    this.crossAxisCount = 4,
    this.iconSize = 30,
    this.title = 'Escolha um ícone',
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: GridView.builder(
          itemCount: icons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final icon = icons[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                onIconSelected(icon);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(icon, size: iconSize),
              ),
            );
          },
        ),
      ),
    );
  }
}
