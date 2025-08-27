import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/firebase_options.dart';
import 'package:todo_list/providers/theme_provider.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/screens/login_screen.dart';
import 'package:todo_list/services/auth_service.dart';
import 'package:todo_list/theme/app_colors.dart';
import 'package:todo_list/theme/app_text_themes.dart';

void main() async {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider())
  ], child: MyApp(),);
}

class MyApp extends StatelessWidget {
  final _authService = AuthService();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: AppColors.getColorScheme(themeProvider.isDark),
        textTheme: AppTextThemes.getTextTheme(),
      ),
      themeMode: themeProvider.themeMode,
      initialRoute: _authService.isLogged ? '/home' : '/login',
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}