import 'package:artgallery_explorer/theme/app_colors.dart';
import 'package:artgallery_explorer/widgets/custom_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            const CustomNavigationRail(selectedIndex: 5,),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (themeProvider.themeMode == ThemeMode.dark) {
                      themeProvider.toggleTheme(false);
                    } else {
                      themeProvider.toggleTheme(true);
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.accentLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          themeProvider.themeMode == ThemeMode.dark
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          size: 70,
                        ),
                        const SizedBox(height: 8),
                        const Text("Mudar Tema"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )

      ),
    );
  }
}
