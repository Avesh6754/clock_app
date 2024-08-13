import 'dart:async';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${(future.hour % 12 == 0) ? 12.toString().padLeft(2, '0') : (future.hour % 12).toString().padLeft(2, '0')}:${future.minute.toString().padLeft(2, '0')}",
                  style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${future.second.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: -2,
                      fontFamily: 'Digital'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${(future.hour < 12) ? 'AM' : "PM"}',
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: -2,
                      fontFamily: 'Digital'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${days[future.weekday - 1]} ${future.day} ${month[future.month - 1]}',
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Digital'))
              ],
            ),
            const Spacer(
              flex : 4,
            ),
            Spacer(flex: 2,),
            OutlinedButton(style: ButtonStyle(side:WidgetStateProperty.all(BorderSide(color: Colors.grey,width: 2))),onPressed: () {
              Navigator.of(context).pushNamed('/analog');
            }, child:Text('Next',style: TextStyle(fontSize: 30,color: Colors.black54,fontWeight: FontWeight.w600
              ,),)),
            Spacer(),
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
    return 'assets/image/2.jpg';
  } else {
    return 'assets/image/5.jpg';
  }
}
