import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FilmKu',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF110E47),
            fontSize: 16,
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.w900,
            height: 0,
            letterSpacing: 0.32,
          ),
        ),actions: [],
      ),
    );
  }
}
