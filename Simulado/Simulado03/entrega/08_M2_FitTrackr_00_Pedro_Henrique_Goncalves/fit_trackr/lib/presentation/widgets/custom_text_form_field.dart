import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController controller;
  String label;
  bool? isPassword;
  TextInputType? keyboardType;
  Function(dynamic _)? onChanged;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword == true ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.titleLarge,
        border: OutlineInputBorder(borderSide: BorderSide(width: 3.0)),
        suffixIcon: widget.isPassword == true
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}
