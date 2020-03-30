import 'package:flutter/material.dart';
import 'package:todoapp/pages/home.dart';
import 'package:todoapp/pages/add_tasks.dart';
import 'package:todoapp/pages/datepicker.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/addTasks': (context) => AddTasks(),
    '/datePicker': (context) => DatePicker(),
  },
));
