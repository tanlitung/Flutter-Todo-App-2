import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime dateTime = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 500.0,
              child: CupertinoDatePicker(
                initialDateTime: dateTime,
                maximumDate: DateTime.now().add(new Duration(days: 366)),
                minimumDate: DateTime.now().subtract(new Duration(minutes: 1)),
                onDateTimeChanged: (_dateTime) {
                  setState(() {
                    dateTime = _dateTime;
                  });
                },
              ),
            ),

            RaisedButton(
              child: Text(
                  'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: const Color(0xFF5786FF),
              onPressed: () {
                Navigator.pop(context, dateTime);
              }
            ),
          ],
        ),
      ),
    );
  }
}
