import 'package:flutter/material.dart';
import 'package:todoapp/todotasks.dart';

class HomePageIcon extends StatelessWidget {
  final String text;
  final int number;
  final List<TodoItem> todoItem;

  HomePageIcon({this.text, this.number, this.todoItem});

  Widget listIcon (String text) {
    switch (text) {
      case 'All': return (Icon(Icons.content_paste, color: const Color(0xFF5786FF), size: 34.0,));
      case 'Work': return (Icon(Icons.work, color: const Color(0xFFFDBA77), size: 34.0,));
      case 'Music': return (Icon(Icons.headset, color: const Color(0xFFF89380), size: 34.0,));
      case 'Travel': return (Icon(Icons.flight_takeoff, color: const Color(0xFF57CB7B), size: 34.0,));
      case 'Study': return (Icon(Icons.book, color: const Color(0xFF8d86d1), size: 34.0,));
      case 'Home': return (Icon(Icons.home, color: const Color(0xFFdc6a5b), size: 34.0,));
      case 'Hobby': return (Icon(Icons.color_lens, color: const Color(0xFFac69c5), size: 34.0,));
      case 'Shopping': return (Icon(Icons.shopping_cart, color: const Color(0xFF43b2be), size: 34.0,));
      default: return (Icon(Icons.reorder, color: const Color(0xFF5786FF), size: 34.0,));
    }
  }

  double listPadding (String text) {
    switch (text) {
      case 'All': return 95.0;
      case 'Work': return 95.0;
      case 'Music': return 78.0;
      case 'Travel': return 85.0;
      case 'Study': return 83.0;
      case 'Home': return 86.0;
      case 'Hobby': return 75.0;
      case 'Shopping': return 50.0;
      default: return 105.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.fromLTRB(15.0, 20.0, listPadding(text), 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            listIcon(text),

            SizedBox(height: 25.0),

            Text(
              text,
              style: TextStyle(
                  fontSize: 24.0
              ),
            ),

            Text(
              '$number Tasks',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
            ),

          ],
        ),

      );

  }
}
