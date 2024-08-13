import 'package:clock_app_task/screens/Analog_clock/analog_clock.dart';
import 'package:clock_app_task/screens/Timer/Timer.dart';
import 'package:clock_app_task/screens/strap_watch/strap_watch.dart';
import 'package:flutter/material.dart';

import '../screens/digital.dart';

DateTime future = DateTime.now();

List days = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
List month = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

var second=0;
var minutes=0;
var hour=0;
bool stop=false;
var myindex=0;

List<Widget> screenlist=[
  DigitalClock(),
  AnalogClock(),
  StrapWatch(),
  Timerpage(),
];

TextEditingController myminutes = TextEditingController();
TextEditingController myhour = TextEditingController();
TextEditingController mysecond = TextEditingController();