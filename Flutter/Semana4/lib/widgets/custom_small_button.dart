import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  CustomSmallButton({this.label,this.onTap,this.textStyle,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: 105,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        onPressed: onTap,
        child: Text(
          label!,
          style: textStyle?.copyWith(color: Colors.white)
        ),
      ),
    );
  }
}
