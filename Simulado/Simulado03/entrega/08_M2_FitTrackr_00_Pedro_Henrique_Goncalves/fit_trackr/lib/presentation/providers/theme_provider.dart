import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.system;

  bool get isDark => _currentTheme == ThemeMode.dark;
  ThemeMode get currentTheme => _currentTheme;

  ThemeProvider() {
    _loadPreferences();
  }

  _loadPreferences() async {
    final _prefs = await SharedPreferences.getInstance();
    final _isDark = _prefs.getBool("isDark") ?? false;

    if (_isDark) {
      _currentTheme = ThemeMode.dark;
    } else {
      _currentTheme = ThemeMode.light;
    }
    notifyListeners();
  }

  toggleTheme() async{
    final prefs = await SharedPreferences.getInstance();
    if(_currentTheme == ThemeMode.dark){
      _currentTheme = ThemeMode.light;
    } else{
      _currentTheme = ThemeMode.dark;
    }

    prefs.setBool("isDark", _currentTheme == ThemeMode.dark);
    notifyListeners();
  }
}
