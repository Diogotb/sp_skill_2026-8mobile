import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/themes/app_text_themes.dart';
import 'package:my_notes/providers/theme_provider.dart';
import 'package:my_notes/views/add_category_page.dart';
import 'package:my_notes/views/add_note_page.dart';
import 'package:my_notes/views/caderno_page.dart';
import 'package:my_notes/views/categories_page.dart';
import 'package:my_notes/views/configuration_page.dart';
import 'package:my_notes/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return MaterialApp(
      localizationsDelegates: const [FlutterQuillLocalizations.delegate],
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
        textTheme: TextTheme(
          headlineLarge: AppTextThemes.headingLarge,
          headlineMedium: AppTextThemes.headingMedium,
          bodyLarge: AppTextThemes.bodyLarge,
          bodyMedium: AppTextThemes.bodyMedium,
          bodySmall: AppTextThemes.bodySmall,
        ),
        colorScheme: AppColors.getColorScheme(false),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: AppTextThemes.headingLarge,
          headlineMedium: AppTextThemes.headingMedium,
          bodyLarge: AppTextThemes.bodyLarge,
          bodyMedium: AppTextThemes.bodyMedium,
          bodySmall: AppTextThemes.bodySmall,
        ),
        colorScheme: AppColors.getColorScheme(true),
        useMaterial3: true,
      ),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/config': (context) => ConfigurationPage(),
        '/caderno': (context) => CadernoPage(),
        '/categories': (context) => CategoriesPage(),
        '/category/add': (context) => AddCategoryPage(),
      },
    );
  }
}
