import 'package:flutter/material.dart';
import 'package:my_notes/themes/app_colors.dart';
import 'package:my_notes/themes/theme_provider.dart';
import 'package:my_notes/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MyApp()
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
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      theme: ThemeData(
        colorScheme: AppColors.getColorScheme(false),
          useMaterial3: true
      ),
      darkTheme: ThemeData(
        colorScheme: AppColors.getColorScheme(true),
        useMaterial3: true
      ),
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
