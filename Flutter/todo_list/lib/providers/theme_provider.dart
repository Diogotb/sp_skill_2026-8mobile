import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode _currentTheme = ThemeMode.system;
  String _prefKey = "theme";

  ThemeProvider(){
    loadThemeMode();
  }

  ThemeMode get themeMode => _currentTheme;

  bool get isDark => _currentTheme == ThemeMode.dark ? true : false;

  void toggleTheme() async {
    if(_currentTheme == ThemeMode.light){
      _currentTheme = ThemeMode.dark;
    } else if(_currentTheme == ThemeMode.dark){
      _currentTheme = ThemeMode.light;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefKey, _currentTheme.index);
    notifyListeners();
  }

  void loadThemeMode() async{
    final prefs = await SharedPreferences.getInstance();
    final int _themeIndex = await prefs.getInt(_prefKey) ?? ThemeMode.system.index;
    _currentTheme = ThemeMode.values[_themeIndex];
    notifyListeners();
  }
}