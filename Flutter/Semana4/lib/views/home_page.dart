import 'package:flutter/material.dart';
import 'package:my_notes/themes/theme_provider.dart';
import 'package:my_notes/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 200,
              color: Theme.of(context).primaryColor,
              child: Text("Teste"),
            ),

            ElevatedButton(onPressed: () {
              if(themeProvider.themeMode == ThemeMode.dark){
                themeProvider.toggleTheme(false);
              } else{
                themeProvider.toggleTheme(true);
              }
            }, child: Text("Testar tema")
            ),
          ],
        ),
      ),
    );
  }
}
