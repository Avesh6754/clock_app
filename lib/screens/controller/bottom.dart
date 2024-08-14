import 'package:clock_app_task/utils/global.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screenlist,
        index: myindex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blueAccent,

          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (value) {
            setState(() {
              myindex=value;
            });
          },currentIndex: myindex,items:const [

        BottomNavigationBarItem(
      backgroundColor: Colors.blue,
            icon: Icon(Icons.mobile_screen_share_outlined,size: 25,), label: 'Digital',),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.watch_later_outlined,size: 25), label: 'Analog'),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.timer_outlined,size: 25,), label: 'Stopwatch'),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.timelapse_rounded,size: 25,), label: 'Timer'),
      ]),
    );
  }
}
