import 'package:flutter/material.dart';

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


TextEditingController myminutes = TextEditingController();
TextEditingController myhour = TextEditingController();
TextEditingController mysecond = TextEditingController();