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
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed('/bottom');
    },);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/image/1-removebg-preview.png'),fit: BoxFit.cover)
              ),
              
             
            ),
            const Text('Life Clock',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black,letterSpacing: 2),)
          ],
        ),
      ),
    );
  }
}
