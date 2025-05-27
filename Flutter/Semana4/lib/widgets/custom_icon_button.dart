import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double size;
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;
  const CustomIconButton({super.key, required this.size, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.surface, size: 80,),
              Text(label, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.surface),)
            ],
          ),
        ),
      ),
    );
  }
}
