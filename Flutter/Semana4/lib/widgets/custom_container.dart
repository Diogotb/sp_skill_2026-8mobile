import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/app_colors.dart';
import '../themes/theme_provider.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  const CustomContainer({this.width, this.child, this.height, super.key});

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
          height: height,
          width: width,
          alignment: Alignment.topCenter,
          child: child,
        )
    );
  }
}
