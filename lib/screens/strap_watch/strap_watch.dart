import 'dart:async';
import 'dart:math';

import 'package:clock_app_task/utils/global.dart';
import 'package:flutter/material.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();
}

class _StrapWatchState extends State<StrapWatch> {
  void strapwatchlogic() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (stop) {
            second++;
            if (second > 59) {
              minutes++;
              second = 0;
              if (minutes > 59) {
                hour++;
                minutes = 0;
                second = 0;
              }
            }
          }
        });
      },
    );
  }

  bool play = false;
  List lab = [];

  void labudf() {
    String newlab =
        "${hour.toString().padLeft(2, "0")} : ${minutes.toString().padLeft(2, "0")} : ${second.toString().padLeft(2, "0")}";
    setState(() {
      lab.add(newlab);
    });
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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(70),
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  color: Color(0xFF0A0A0A),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1A1C1D),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Transform.scale(
                        scale: 2,
                        child: Container(
                          height: 129,
                          width: 129,
                          child: CircularProgressIndicator(
                            value: second / 60,
                            valueColor:
                                AlwaysStoppedAnimation(Colors.tealAccent),
                          ),
                        ),
                      ),
                    ),
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
                        '${hour.toString().padLeft(2, "0")} : ${minutes.toString().padLeft(2, "0")} : ${second.toString().padLeft(2, "0")}',
                        style: const TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              height: 180,
              width: 300,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(),
              child: ListView.builder(
                itemCount: lab.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lab ${index + 1} ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            '${lab[index]}',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        labudf();
                      });
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 0.5, color: Colors.white54)),
                        child: Icon(
                          Icons.flag,
                          color: Colors.white,
                          size: 25,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        play = !play;
                        (play == false) ? stop = true : stop = false;
                      });
                    },
                    child: Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.tealAccent),
                        child: Icon(
                          (play == false) ? Icons.play_arrow : Icons.pause,
                          size: 40,
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        second = 0;
                        minutes = 0;
                        hour = 0;
                        stop = false;
                        lab.clear();
                      });
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 0.5, color: Colors.white54)),
                        child: Icon(
                          Icons.restart_alt,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
