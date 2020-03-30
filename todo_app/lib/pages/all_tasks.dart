import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/todotasks.dart';

class AllTasks extends StatefulWidget {
  final List<TodoItem> todoItem;

  AllTasks({Key key, @required this.todoItem}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState(todoItem: todoItem);
}

class _AllTasksState extends State<AllTasks> {
  List<TodoItem> todoItem;
  _AllTasksState({this.todoItem});

  Widget displayReminder (TodoItem todoItem) {
    if ((todoItem.reminder.year) == (DateTime.now().year + 70)) {
      return Text(
        'No time frame',
        style: TextStyle(
          fontSize: 14.0,
        ),
      );
    }

    else {
      return Text(
        '${todoItem.reminder.day}.${todoItem.reminder.month}.${todoItem.reminder.year}  ${todoItem.reminder.hour}:${todoItem.reminder.minute}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      );
    }
  }

  Widget displayList () {
    if (todoItem.length > 0) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Dismissible(
                key: Key(todoItem[index].todo),
                onDismissed: (direction) {
                  setState(() {
                    todoItem.removeAt(index);
                  });
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete),
                ),
                child: Container(
                  height: 70.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 280.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              strike(todoItem[index].done, todoItem[index].todo),

                              SizedBox(height: 6.0,),

                              displayReminder(todoItem[index]),
                            ],
                          ),
                        ),

                    IconButton(
                      icon: checkbox(todoItem[index].done),
                      onPressed: () {
                        setState(() {
                          todoItem[index].done = !todoItem[index].done;
                        });
                      },
                    ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: todoItem.length,
        ),
      );
    }

    else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Container(
              height: 400.0,
              alignment: Alignment.center,
              child: Text('No Item Added'),
            );
          },
          childCount: 1,
        ),
      );
    }
  }

  Widget strike (bool done, String text) {
    if (done) {
      return Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.lineThrough,
          color: Colors.grey,
        ),
      );
    }

    else {
      return Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  Widget checkbox (bool done) {
    if (done) {
      return Icon(Icons.check_box);
    }

    else {
      return Icon(Icons.check_box_outline_blank);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xFF5786FF),
            expandedHeight: 180.0,
            floating: true,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: IconButton(
              icon: Icon(
                  Icons.arrow_back_ios,
                color: Colors.white,
              ),
                onPressed: () {
                Navigator.pop(
                    context,
                  todoItem
                );
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                  'All Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              background: Image(
                image: AssetImage('assets/all.png'),
              ),
            ),
          ),

          displayList(),

        ],
      ),
    );
  }
}
