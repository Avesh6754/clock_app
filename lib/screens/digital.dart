import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/global.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          future = DateTime.now();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('${background(future)}'), fit: BoxFit.cover)),
        child: Column(
          children: [
            Spacer(),
            Column(
              children: [
                Text(
                  "${(future.hour % 12 == 0) ? 12.toString().padLeft(2, '0') : (future.hour % 12).toString().padLeft(2, '0')}",
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "${future.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        fontSize: 60,
                        height: 0.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Transform.rotate(
                      angle: pi / 2,
                      child: Text(
                        '${(future.hour < 12) ? 'AM' : "PM"}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${days[future.weekday - 1]} ${future.day} ${month[future.month - 1]}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ))
              ],
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),

    );
  }
}

var name = '0';

String background(DateTime future) {
  final hour = future.hour;
  if (hour >= 0 && hour < 6) {
    return 'assets/image/6.jpg';
  } else if (hour >= 6 && hour < 9) {
    return 'assets/image/3.jpg';
  } else if (hour >= 9 && hour < 12) {
    return 'assets/image/1.jpg';
  } else if (hour >= 12 && hour < 16) {
    return 'assets/image/4.jpg';
  } else if (hour >= 16 && hour < 19) {
    return 'assets/image/2.jfif';
  } else {
    return 'assets/image/5.jpg';
  }
}
