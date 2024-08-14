import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/global.dart';
import '../digital.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
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
              image: AssetImage('${background(future)}'), fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black38),
            ),
            SizedBox(
              height: 20,
            ),
            Transform.rotate(
              angle: (future.minute * 6) * pi / 180,
              child: VerticalDivider(
                indent: 295,
                endIndent: 355,
                color: Colors.white,
                thickness: 2,
              ),
            ),
            Transform.rotate(
              angle: (future.hour * 30 + future.minute * 0.5) * pi / 180,
              child: VerticalDivider(
                indent: 315,
                endIndent: 355,
                color: Colors.white,
                thickness: 4,
              ),
            ),
            ...List.generate(
              60,
              (index) => Transform.rotate(
                angle: (index * 30) * pi / 180,
                child: VerticalDivider(
                  thickness: 1,
                  color: Colors.white,
                  endIndent: 272,
                  indent: 462,
                ),
              ),
            ),
            Transform.rotate(
              angle: (future.second * 6) * pi / 180,
              child: VerticalDivider(
                indent: 285,
                endIndent: 355,
                color: Colors.red,
                thickness: 2,
              ),
            ),
            const CircleAvatar(
              radius: 5,
              backgroundColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 120,
                    margin: EdgeInsets.only(left: 40, right: 40, top: 50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                                    ,color: Colors.white12
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${(future.hour % 12 == 0) ? 12.toString().padLeft(2, '0') : (future.hour % 12).toString().padLeft(2, '0')}',
                                style: TextStyle(color: Colors.white, fontSize: 40),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                  ,color: Colors.white12
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${future.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(color: Colors.white, fontSize: 40),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                  ,color: Colors.white12
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${future.second.toString().padLeft(2, '0')}',
                                style: TextStyle(color: Colors.white, fontSize: 40),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              height: 30,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                  ,color: Colors.white12
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${(future.hour < 12) ? 'AM' : "PM"}',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                '${days[future.weekday - 1]} ${future.day} ${month[future.month - 1]}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
