
import 'package:clock_app_task/screens/Analog_clock/analog_clock.dart';
import 'package:clock_app_task/screens/Timer/Timer.dart';
// import 'package:clock_app_task/screens/Timer/timer.dart';
import 'package:clock_app_task/screens/digital.dart';

import 'package:clock_app_task/screens/strap_watch/strap_watch.dart';
import 'package:flutter/material.dart';


void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/clock':(context)=>DigitalClock(),
        '/analog':(context)=>AnalogClock(),
        '/strap':(context)=>StrapWatch(),
        '/':(context)=>Timerpage(),

      },
    );
  }
}
