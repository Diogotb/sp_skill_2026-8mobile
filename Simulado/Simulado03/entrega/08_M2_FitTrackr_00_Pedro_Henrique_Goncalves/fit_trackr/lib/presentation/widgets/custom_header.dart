import 'package:fit_trackr/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomHeader extends StatelessWidget {
  final String label;

  const CustomHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () => themeProvider.toggleTheme(),
              icon: Icon(themeProvider.isDark ? Icons.dark_mode : Icons.light_mode),
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFA8A8A8),
              child: Text("Foto"),
            ),
          ],
        ),
      ),
    );
  }
}
