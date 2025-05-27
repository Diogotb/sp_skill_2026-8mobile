import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  final double? width;
  final double? height;
  final IconData? icon;
  final Color? color;
  final String label;
  double? labelSize = 24;
  final VoidCallback? onTap;
  CustomDrawerButton({
    super.key,
    this.labelSize,
    this.color,
    this.width = 240,
    this.height = 70,
    this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = color ?? Theme.of(context).colorScheme.primary;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      elevation: 7.5,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.surface,
                size: 60,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: this.labelSize,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
