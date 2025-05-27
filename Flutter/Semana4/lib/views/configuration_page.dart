import 'package:flutter/material.dart';
import 'package:my_notes/widgets/custom_app_bar.dart';
import 'package:my_notes/widgets/custom_drawer.dart';
import 'package:my_notes/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24,),
            Text("Configurações", style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 24,),
            CustomIconButton(size: 150, icon: themeProvider.themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode, label: "Tema", onTap: () {
              if(themeProvider.themeMode == ThemeMode.dark){
                themeProvider.toggleTheme(false);
              } else{
                themeProvider.toggleTheme(true);
              }
            },)
          ],
        ),
      ),
    );

  }
}
