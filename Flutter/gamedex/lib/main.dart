import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamedex/providers/game_provider.dart';
import 'package:gamedex/providers/internet_provider.dart';
import 'package:gamedex/providers/review_provider.dart';
import 'package:gamedex/providers/theme_provider.dart';
import 'package:gamedex/screens/explore_screen.dart';
import 'package:gamedex/screens/favorites_screen.dart';
import 'package:gamedex/screens/home_screen.dart';
import 'package:gamedex/screens/login_screen.dart';
import 'package:gamedex/screens/no_internet_screen.dart';
import 'package:gamedex/screens/search_screen.dart';
import 'package:gamedex/screens/settings_screen.dart';
import 'package:gamedex/screens/sign_up_screen.dart';
import 'package:gamedex/theme/app_colors.dart';
import 'package:gamedex/theme/app_text_themes.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider(),)
        // ChangeNotifierProvider(create: (_) => InternetProvider()),
      ],
      child: const GameDex(),
    ),
  );
}

class GameDex extends StatelessWidget {
  const GameDex({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return MaterialApp(
      title: 'GameDex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // pageTransitionsTheme: PageTransitionsTheme(
        //   builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        // ),
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
      initialRoute: '/login',
      routes: {
        "/login": (_) => LoginScreen(),
        "/signup": (_) => SignUpScreen(),
        "/home": (_) => HomeScreen(),
        "/settings": (_) => const SettingsScreen(),
        "/favorites": (_) => FavoritesScreen(),
        "/explore": (_) => ExploreScreen(),
        "/search": (_) => SearchScreen(),
        "/no-internet": (_) => const NoInternetScreen(),
      },
    );
  }
}