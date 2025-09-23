import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(AnimationsDemoApp());
}

class AnimationsDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimationsDemoPage(),
    );
  }
}

class AnimationsDemoPage extends StatefulWidget {
  @override
  _AnimationsDemoPageState createState() => _AnimationsDemoPageState();
}

class _AnimationsDemoPageState extends State<AnimationsDemoPage>
    with SingleTickerProviderStateMixin {
  bool _isBig = false;

  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _rotationAnimation =
    Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSize() {
    setState(() {
      _isBig = !_isBig;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animations Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleSize,
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _isBig ? 200 : 100,
                height: _isBig ? 200 : 100,
                decoration: BoxDecoration(
                  color: _isBig ? Colors.orange : Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                child: Text(
                  'Tap me!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 50),
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Icon(Icons.refresh, color: Colors.white, size: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
