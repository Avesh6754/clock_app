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
            icon: Icon(Icons.mobile_screen_share_outlined,color: Colors.grey,size: 25,), label: 'Digital',),
        BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined,color: Colors.grey,size: 25), label: 'Analog'),
        BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined,color: Colors.grey,size: 25,), label: 'Stopwatch'),
        BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_rounded,color: Colors.grey,size: 25,), label: 'Timer'),
      ]),
    );
  }
}
