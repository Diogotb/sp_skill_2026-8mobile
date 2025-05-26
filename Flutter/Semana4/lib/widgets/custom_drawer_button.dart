import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData? icon;
  final Color? color;
  final String label;
  final VoidCallback? onTap;
  const CustomDrawerButton({super.key, this.color,required this.width, required this.height, this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(15),
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.surface, size: 60,),
              Text(label, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.surface),)
            ],
          ),
        ),
      ),
    );
  }
}
