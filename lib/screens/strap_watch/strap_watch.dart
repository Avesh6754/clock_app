import 'dart:async';

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
          if(stop)
          {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    strapwatchlogic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/8.jpg'), fit: BoxFit.cover),
          ),
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.center, children: [
            Text(
              "${hour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}",
              style: const TextStyle(
                  color: Colors.white,

                  fontSize: 50,
                  height: -5
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white24)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/timer');
                  },
                  child: const Text(
                    'NextPage',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white24)),
                          onPressed: () {
                            setState(() {
                              stop=true;
                            });
                          },
                          child: const Text(
                            'Start',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white24)),
                          onPressed: () {
                            setState(() {
                              stop=false;
                            });
                          },
                          child: const Text(
                            'Pause',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        ElevatedButton(style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white24)),
                          onPressed: () {
                            setState(() {
                              stop=false;
                              second=0;
                              minutes=0;
                              hour=0;
                            });
                          },
                          child: const Text(
                            'Reset',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ]),
                ),
              ],
            )
          ])),
    );
  }
}