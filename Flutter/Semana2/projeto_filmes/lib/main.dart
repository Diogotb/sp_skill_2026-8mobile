import 'package:flutter/material.dart';
import 'package:projeto_filmes/theme/app_colors.dart';
import 'package:projeto_filmes/theme/app_text_themes.dart';
import 'package:projeto_filmes/views/detalhes_page.dart';
import 'package:projeto_filmes/views/home_page.dart';
import 'package:projeto_filmes/views/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary500,
          primary: AppColors.primary500,
          secondary: AppColors.complementary300,
        ),
        primaryColor: AppColors.primary500,
        scaffoldBackgroundColor: AppColors.primary400,
        textTheme: TextTheme(
          headlineLarge: AppTextThemes.title,
          headlineMedium: AppTextThemes.secondaryTitle,
          bodyLarge: AppTextThemes.body,
          bodyMedium: AppTextThemes.body,
          bodySmall: AppTextThemes.bodySmall,
        ),
      ),

      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary500,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          headlineLarge: AppTextThemes.title,
          headlineMedium: AppTextThemes.secondaryTitle,
          bodyLarge: AppTextThemes.body.copyWith(color: Colors.white),
          bodyMedium: AppTextThemes.body.copyWith(color: Colors.white),
          bodySmall: AppTextThemes.bodySmall.copyWith(color: Colors.grey[400]),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/detalhes': (context) => DetalhesPage(),
      },
    );
  }
}
