import 'dart:async';
import 'dart:math';
import 'package:animated_icon/animated_icon.dart';
import 'package:clock_app_task/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../utils/global.dart';

class Timerpage extends StatefulWidget {
  const Timerpage({super.key});

  @override
  State<Timerpage> createState() => _TimerpageState();
}

class _TimerpageState extends State<Timerpage> {
  int currenthour = 0;
  int currentminutes = 0;
  int currentsecond = 0;
  bool isplay = true;

  var secondtimer = 0;
  var minutestimer = 0;
  var hourtimer = 0;
  bool stoptimer = false;

  void strapwatchlogic() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (secondtimer != 0 || minutestimer != 0 || hourtimer != 0) {
            if (stoptimer) {
              secondtimer--;
              if (secondtimer < 0) {
                minutestimer--;
                secondtimer = 59;
                if (minutestimer < 0) {
                  hourtimer--;
                  minutestimer = 59;
                  secondtimer = 59;
                }
              }
            }
          }
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    strapwatchlogic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(color: Colors.black,image: DecorationImage(opacity: 0.6,image: AssetImage('assets/image/9.jpg'),fit: BoxFit.cover)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(70),
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Colors.white12,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:  Colors.black38,
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Center(
                      //   child: Transform.scale(
                      //     scale: 2,
                      //     child: Container(
                      //       height: 100,
                      //       width: 100,
                      //       child: CircularProgressIndicator(
                      //         value: secondtimer / 60,
                      //         valueColor:
                      //             AlwaysStoppedAnimation(Colors.tealAccent),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ...List.generate(
                        60,
                        (index) => Center(
                          child: Transform.rotate(
                            angle: index * 6 * pi / 180,
                            child: const VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                              indent: 285,
                              endIndent: 10,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${hourtimer.toString().padLeft(2, "0")} : ${minutestimer.toString().padLeft(2, "0")} : ${secondtimer.toString().padLeft(2, "0")}',
                          style: const TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 114,
                          width: 114,
                          child: Transform.scale(
                            scale: 2,
                            child: CircularProgressIndicator(
                              color: Colors.tealAccent,

                              value: secondtimer / 60,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Hour",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Minutes",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Second ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              height: 130,
              width: double.infinity,
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white12,
                border: Border.all(width: 0.2, color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              child: timerudf(),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isplay = !isplay;
                      (isplay == false) ? stoptimer = true : stoptimer = false;
                    });
                  },
                  child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.tealAccent),
                      child: Icon(
                        (isplay == false) ? Icons.play_arrow : Icons.pause,
                        size: 40,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      secondtimer = 0;
                      minutestimer = 0;
                      hourtimer = 0;
                      stoptimer = false;
                    });
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.5, color: Colors.white54),
                      ),
                      child: Icon(
                        Icons.restart_alt,
                        size: 25,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Row timerudf() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: ListWheelScrollView(
              onSelectedItemChanged: (value) {
                hourtimer = value;
              },
              itemExtent: 61,
              diameterRatio: 0.9,
              perspective: 0.01,
              children: [
                ...List.generate(
                    100,
                    (index) => Text(
                          '$index',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ))
              ]),
        ),
        SizedBox(
          width: 100,
          child: ListWheelScrollView(
              onSelectedItemChanged: (value) {
                minutestimer = value;
              },
              itemExtent: 61,
              diameterRatio: 0.9,
              perspective: 0.01,
              children: [
                ...List.generate(
                    60,
                    (index) => Text(
                          '$index',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ))
              ]),
        ),
        SizedBox(
          width: 100,
          child: ListWheelScrollView(
              onSelectedItemChanged: (value) {
                secondtimer = value;
              },
              itemExtent: 61,
              diameterRatio: 0.9,
              perspective: 0.01,
              children: [
                ...List.generate(
                    60,
                    (index) => Text(
                          '$index',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ))
              ]),
        ),
      ],
    );
  }
}
