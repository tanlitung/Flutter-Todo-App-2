import 'package:flutter/material.dart';

class AddTasks extends StatefulWidget {
  @override
  _AddTasksState createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  String category = 'Category';
  String todo = '';
  String note = '';
  bool reminderChanged = false;
  int reminderDate;
  int reminderMonth;
  int reminderYear;
  int reminderHour;
  int reminderMinute;
  String reminderAMPM = 'AM';
  DateTime reminder;
  final tasksController = TextEditingController();
  final reminderController = TextEditingController();
  final noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget chooseIcon (String category) {
    switch (category) {
      case 'Work': return (Icon(Icons.work, color: const Color(0xFFFDBA77), size: 24.0,));
      case 'Music': return (Icon(Icons.headset, color: const Color(0xFFF89380), size: 24.0,));
      case 'Travel': return (Icon(Icons.flight_takeoff, color: const Color(0xFF57CB7B), size: 24.0,));
      case 'Study': return (Icon(Icons.book, color: const Color(0xFF8d86d1), size: 24.0,));
      case 'Home': return (Icon(Icons.home, color: const Color(0xFFdc6a5b), size: 24.0,));
      case 'Hobby': return (Icon(Icons.color_lens, color: const Color(0xFFac69c5), size: 24.0,));
      case 'Shopping': return (Icon(Icons.shopping_cart, color: const Color(0xFF43b2be), size: 24.0,));
      case 'Category': return Icon(Icons.local_offer, color: Colors.grey[600],);
      default: return Icon(Icons.local_offer, color: Colors.grey[600],);
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Choose a category:'),
        content: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.work, color: const Color(0xFFFDBA77), size: 34.0),
                      label: Text('Work'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          category = 'Work';
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.headset, color: const Color(0xFFF89380), size: 34.0,),
                      label: Text('Music'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          category = 'Music';
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.flight_takeoff, color: const Color(0xFF57CB7B), size: 34.0,),
                      label: Text('Travel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          category = 'Travel';
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.book, color: const Color(0xFF8d86d1), size: 34.0,),
                      label: Text('Study'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          category = 'Study';
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.home, color: const Color(0xFFdc6a5b), size: 34.0,),
                      label: Text('Home'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          category = 'Home';
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.color_lens, color: const Color(0xFFac69c5), size: 34.0,),
                      label: Text('Hobby'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          category = 'Hobby';
                        });
                      },
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.shopping_cart, color: const Color(0xFF43b2be), size: 34.0,),
                      label: Text('Shopping'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          category = 'Shopping';
                        });
                      },
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  String reminderText() {
    String text = 'Add deadline';
    if (reminderChanged == true) {
      text = '$reminderDate/$reminderMonth/$reminderYear $reminderHour.'+ minute() + ' $reminderAMPM';
    }

    else{
      reminder = new DateTime.now();
      reminder = reminder.add(new Duration(days: 25620));
    }
    return text;
  }

  String minute() {
    String places = '00';
    if(reminderMinute <= 9) {
      places = '0${reminderMinute.toString()}';
    }

    else {
      places = reminderMinute.toString();
    }
    return places;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 60.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(
                      flex: 6,
                    ),
                    Text(
                      'New Task',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),

                    Spacer(
                      flex: 5,
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                          Icons.close,
                          size: 30.0
                      ),
                    ),

                    Spacer(
                        flex:1
                    ),
                  ],
                ),
                 SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextFormField(
                    controller: tasksController,
                    maxLines: 1,
                    autocorrect: false,
                    validator: (String value) {
                      return value.isEmpty ? 'Please enter a task.': null;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                      labelText: 'What are you planning?',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        dynamic result = await Navigator.pushNamed(context, '/datepicker');
                        setState(() {
                          reminderDate = result.day;
                          reminderMonth = result.month;
                          reminderYear = result.year;
                          if(result.hour > 12) {
                            reminderHour = result.hour - 12;
                            reminderAMPM = 'PM';
                          }

                          else if(result.hour == 0) {
                            reminderHour = 12;
                            reminderAMPM = 'AM';
                          }

                          else{
                            reminderHour = result.hour;
                            reminderAMPM = 'AM';
                          }
                          reminderMinute = result.minute;
                          reminderChanged = true;
                          reminder = result;
                        });

                        },
                      child: Row(
                        children: <Widget>[
                          Icon(
                              Icons.notifications,
                              color: Colors.grey[600],
                              size: 24.0,
                          ),

                          SizedBox(width: 15.0,),

                          Text(
                            reminderText(),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                  child: TextFormField(
                    controller: noteController,
                    maxLines: 1,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.insert_drive_file),
                      hintText: 'Add note',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 20.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () {
                        _showDialog();
                      },
                      child: Row(
                        children: <Widget>[
                          chooseIcon(category),

                          SizedBox(width: 15.0,),

                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),

            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  if(category == 'Category') {
                    _showDialog();
                  }
                  else if(_formKey.currentState.validate()) {
                    setState(() {
                      todo = tasksController.text;
                      note = noteController.text;
                    });
                    Navigator.pop(context,{
                      'todo': todo,
                      'note': note,
                      'reminder': reminder,
                      'category': category,
                      'done': false,
                    });
                  }


                  print('Tasks = $todo');
                  print('Reminder = $reminderDate/$reminderMonth/$reminderYear $reminderHour.' + minute() + reminderAMPM);
                  note == '' ? note = 'No notes added': note = note;
                  print('Note = $note');
                  print('Category = $category');
                  },
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                        'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: const Color(0xFF5786FF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
