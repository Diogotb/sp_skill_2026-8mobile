import 'package:flutter/material.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Color(0xFF313131),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/detalhes': (context) => DetalhesPage()
      },
    );
  }
}
