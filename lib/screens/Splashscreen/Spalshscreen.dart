import 'dart:async';

import 'package:flutter/material.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 10), (timer) {
      Navigator.of(context).pushReplacementNamed('/bottom');
    },);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/image/bg.gif'),fit: BoxFit.cover)
        ),
        child: Text(''),
      ),
    );
  }
}
