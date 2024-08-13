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
              Transform.scale(scale:2,
                child: Container(
                  height: 140,
                  width: 140,

                  child: CircularProgressIndicator(
                    strokeAlign: 1,
                    color: Colors.white,
                    value: future.second/60,
                  ),
                ),
              ),
              ...List.generate(
                60,
                    (index) => Transform.rotate(
                  angle: (index * 6) * pi / 180,
                  child: VerticalDivider(
                    color: (index%5==0)?Colors.black:Colors.white,
                    thickness:(index%5==0)?4:2,
                    endIndent:(index%5==0)? 480:490,
                    indent:253,
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 6,
                backgroundColor: Colors.black26,
              ),
              Transform.rotate(
                angle: ((future.hour * 30) + future.minute * 0.5) * pi / 180,
                child: const VerticalDivider(
                  thickness: 4,
                  color: Colors.black,
                  endIndent: 360,
                  indent: 320,
                ),
              ),
              Transform.rotate(
                angle: (future.minute * 6) * pi / 180,
                child: const VerticalDivider(
                  thickness: 3,
                  color: Colors.black,
                  endIndent: 360,
                  indent: 290,
                ),
              ),
              Transform.rotate(
                angle: (future.second * 6) * pi / 180,
                child: const VerticalDivider(
                  thickness: 2,
                  color: Colors.red,
                  endIndent: 360,
                  indent: 280,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(alignment: Alignment.bottomCenter,
                  child: OutlinedButton(style: ButtonStyle(side:WidgetStateProperty.all(BorderSide(color: Colors.grey,width: 2))),onPressed: () {
                    Navigator.of(context).pushNamed('/strap');
                  }, child:Text('Next',style: TextStyle(fontSize: 30,color: Colors.black54,fontWeight: FontWeight.w600
                    ,),)),
                ),
              ),

            ],
          ),
        )
    );
  }
}