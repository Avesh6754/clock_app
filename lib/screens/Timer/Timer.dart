
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

  void strapwatchlogic() {
    Timer.periodic(
      Duration(seconds: 1),
          (timer) {
        setState(() {
          if (currentsecond != 0 || currentminutes != 0 || currenthour != 0) {
            if (stoptimer) {
              currentsecond--;
              if (currentsecond < 0) {
                currentminutes--;
                currentsecond = 59;
                if (currentminutes < 0) {
                  currenthour--;
                  currentminutes = 59;
                  currentsecond = 59;
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
      body: Column(
        children: [

          Stack(
            children: [
              Container(
                margin: EdgeInsets.all(70),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
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
                    ...List.generate(
                      60,
                          (index) => Center(
                        child: Transform.rotate(
                          angle: index * 6 * pi / 180,
                          child: VerticalDivider(
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
                        '${currenthour.toString().padLeft(2, "0")} : ${currentminutes.toString().padLeft(2, "0")} : ${currentsecond.toString().padLeft(2, "0")}',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 275,
                        width: 275,
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                          strokeWidth: 6,
                          value: second / 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Hour",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("Minutes",style: TextStyle(fontSize: 20,color: Colors.white),),
              Text("Second ",style: TextStyle(fontSize: 20,color: Colors.white),),
            ],
          ),
          Container(

            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 0.5),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberPicker(
                  axis: Axis.vertical,
                  itemHeight: 45,
                  itemWidth: 45.0,
                  step: 1,
                  selectedTextStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                  itemCount: 3,
                  value: currenthour,
                  minValue: 0,
                  maxValue: 99,
                  onChanged: (v) {
                    setState(() {
                      currenthour = v;
                    });
                  },
                ),
                NumberPicker(
                  axis: Axis.vertical,
                  itemHeight: 45,
                  itemWidth: 45.0,
                  step: 1,
                  selectedTextStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                  itemCount: 3,
                  value: currentminutes,
                  minValue: 0,
                  maxValue: 59,
                  onChanged: (v) {
                    setState(() {
                      currentminutes = v;
                    });
                  },
                ),
                NumberPicker(
                  axis: Axis.vertical,
                  itemHeight: 45,
                  itemWidth: 45.0,
                  step: 1,
                  selectedTextStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                  itemCount: 3,
                  value: currentsecond,
                  minValue: 0,
                  maxValue: 59,
                  onChanged: (v) {
                    setState(() {
                      currentsecond = v;
                    });
                  },
                ),

              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isplay = !isplay;
                    stoptimer = true;
                  });
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.tealAccent
                    ),
                    child:Icon((isplay == false) ? Icons.play_arrow : Icons.pause,size: 35,)
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {currentsecond=0;
                  currentminutes=0;
                  currenthour=0;
                  stoptimer=false;
                  });
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.tealAccent
                    ),
                    child:Icon(Icons.restart_alt,size: 35,)
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
