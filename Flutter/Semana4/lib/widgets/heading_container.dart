import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/app_colors.dart';
import '../themes/theme_provider.dart';

class HeadingContainer extends StatelessWidget {
  final String? label;
  const HeadingContainer({this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeProvider.themeMode == ThemeMode.dark ? AppColors.widgetBackgroundDark : AppColors.widgetBackgroundLight
          ),
          height: 96,
          width: 373,
          alignment: Alignment.center,
          child: Text(label!, style: Theme.of(context).textTheme.headlineLarge,),
        )
    );
  }
}
