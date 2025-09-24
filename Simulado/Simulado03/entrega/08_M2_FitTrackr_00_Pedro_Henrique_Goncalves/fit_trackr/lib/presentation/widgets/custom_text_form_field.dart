import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController controller;
  String label;
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.titleLarge,
        border: OutlineInputBorder(borderSide: BorderSide(width: 3.0)),
      ),
    );
  }
}
