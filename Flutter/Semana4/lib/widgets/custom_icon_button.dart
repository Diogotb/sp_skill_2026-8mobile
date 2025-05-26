import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double size;
  final IconData? icon;
  final String label;
  const CustomButton({super.key, required this.size, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: GestureDetector(
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
              Icon(icon),
              Text(label, style: Theme.of(context).textTheme.headlineLarge,)
            ],
          ),
        ),
      ),
    );
  }
}
