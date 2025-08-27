import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int? _selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: CustomAppBar(title: "GameDex"),
      drawer: CustomDrawer(
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
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _selectedIndex, onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        if(_selectedIndex == 0){
          Navigator.pushNamed(context, '/home');
        }
        else if (_selectedIndex == 1){
          Navigator.pushNamed(context, '/search');
        } else if (_selectedIndex == 2){
          Navigator.pushNamed(context, '/explore');
        }
      },),
    );
  }
}
