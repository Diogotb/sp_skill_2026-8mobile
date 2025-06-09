import 'package:artgallery_explorer/pages/artists_page.dart';
import 'package:artgallery_explorer/pages/exhibitions_page.dart';
import 'package:artgallery_explorer/pages/home_page.dart';
import 'package:artgallery_explorer/pages/settings_page.dart';
import 'package:artgallery_explorer/theme/app_colors.dart';
import 'package:artgallery_explorer/theme/app_text_themes.dart';
import 'package:artgallery_explorer/providers/theme_provider.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
        textTheme: TextTheme(
          headlineLarge: AppTextThemes.title,
          headlineSmall: AppTextThemes.subtitle,
          bodyMedium: AppTextThemes.body,
          bodySmall: AppTextThemes.caption
        ),
        colorScheme: AppColors.getColorScheme(false),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
            headlineLarge: AppTextThemes.title,
            headlineSmall: AppTextThemes.subtitle,
            bodyMedium: AppTextThemes.body,
            bodySmall: AppTextThemes.caption
        ),
        colorScheme: AppColors.getColorScheme(true),
        useMaterial3: true,
      ),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(),
        '/exhibitions': (context) => ExhibitionsPage(),
        // '/collections': (context) => MyCollectionsPage(),
        // '/favorites': (context) => FavoritesPage(),
        '/artists': (context) => ArtistsPage(),
      },
    );
  }
}