import 'package:cine_findr/splash_screen.dart';
import 'package:cine_findr/theme/app_colors.dart';
import 'package:cine_findr/theme/app_text_themes.dart';
import 'package:cine_findr/views/cadastro_page.dart';
import 'package:cine_findr/views/home_page.dart';
import 'package:cine_findr/views/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = ThemeMode.system;
    return MaterialApp(
      title: 'Cine Findr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          error: AppColors.error,
        ),
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundLight,
        textTheme: TextTheme(
          headlineLarge: AppTextThemes.header.copyWith(
            color: AppColors.textLight,
          ),
          bodyMedium: AppTextThemes.body.copyWith(color: AppColors.textLight),
          bodySmall: AppTextThemes.bodysmall.copyWith(
            color: AppColors.textLight,
          ),
        ),
      ),

      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.secondary,
          primary: AppColors.secondary,
          secondary: AppColors.primary,
          error: AppColors.error,
        ),
        primaryColor: AppColors.secondary,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        textTheme: TextTheme(
          headlineLarge: AppTextThemes.header.copyWith(
            color: AppColors.textDark,
          ),
          bodyMedium: AppTextThemes.body.copyWith(color: AppColors.textDark),
          bodySmall: AppTextThemes.bodysmall.copyWith(
            color: AppColors.textDark,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => SplashScreen(),
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
      },
    );
  }
}
