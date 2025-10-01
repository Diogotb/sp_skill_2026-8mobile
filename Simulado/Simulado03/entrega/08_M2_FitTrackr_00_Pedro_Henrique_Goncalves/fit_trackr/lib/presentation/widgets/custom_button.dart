import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  VoidCallback? onPressed;
  String label;
  CustomButton({super.key, required this.onPressed, required this.label});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 75,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          textStyle: TextStyle(
            fontSize: 24,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(widget.label),
      ),
    );
  }
}
