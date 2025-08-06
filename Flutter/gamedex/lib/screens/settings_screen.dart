import 'package:flutter/material.dart';
import 'package:gamedex/widgets/custom_app_bar.dart';
import 'package:gamedex/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(
        userName: "Teste",
        userEmail: "teste@example.com",
        avatarUrl:
        "https://www.gravatar.com/avatar/3b3be63a4c2a439b013787725dfce802?d=identicon",
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Gamer Mode (Night Mode)'),
            subtitle: const Text('Ative para o modo noturno'),
            value: isDarkMode,
            onChanged: (bool value) {
              themeProvider.toggleTheme(value);
            },
            secondary: Icon(isDarkMode ? Icons.nights_stay : Icons.wb_sunny),
          ),
          // TODO: Configurações adicionais
        ],
      ),
    );
  }
}
