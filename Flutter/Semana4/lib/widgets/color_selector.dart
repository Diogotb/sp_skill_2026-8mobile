import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  final Function(Color) onColorSelected;
  final Color? selectedColor;
  const ColorSelector({super.key, required this.onColorSelected, this.selectedColor});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {

  final List<Color> _colors = [
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.cyan,
    Colors.teal,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.lightGreenAccent,
    Colors.indigo,
    Colors.blueGrey,
    Colors.greenAccent,
  ];

  late Color _selectedColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColor = widget.selectedColor ?? _colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _colors.map((color) {
        bool isSelected = color == _selectedColor;
        return GestureDetector(
          onTap: (){
            setState(() {
              _selectedColor = color;
            });
            widget.onColorSelected(color);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: Colors.black, width: 3) : null
            ),
          ),
        );
      }).toList(),
    );

  }
}
