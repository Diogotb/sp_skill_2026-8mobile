import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/pages/cart_page.dart';
import 'package:provider_test/pages/products_page.dart';
import 'package:provider_test/providers/cart_provider.dart';

void main(){
  runApp(
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)
      ),
      initialRoute: "/products",
      routes: {
        "/products": (context) => ProductsPage(),
        "/cart": (context) => CartPage()
      },
    );
  }
}
