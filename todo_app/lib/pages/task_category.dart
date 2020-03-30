import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/todotasks.dart';

class TasksCategory extends StatefulWidget {
  final List<TodoItem> todoItem;
  final String image;
  final String category;

  TasksCategory({Key key, @required this.todoItem, this.image, this.category}) : super(key: key);

  @override
  _TasksCategoryState createState() => _TasksCategoryState(todoItem: todoItem, image: image, category: category);
}

class _TasksCategoryState extends State<TasksCategory> {
  List<TodoItem> todoItem;
  String image;
  String category;
  _TasksCategoryState({this.todoItem, this.image, this.category});

  List<TodoItem> workItem = [];
  List<TodoItem> musicItem = [];
  List<TodoItem> travelItem = [];
  List<TodoItem> studyItem = [];
  List<TodoItem> homeItem = [];
  List<TodoItem> hobbyItem = [];
  List<TodoItem> shoppingItem = [];
  List<TodoItem> categoryList = [];


  void categorise () {
    categoryList.removeRange(0, categoryList.length);
    for (int i = 0; i < todoItem.length; i++) {
      switch (todoItem[i].category) {
        case 'Work': workItem.add(todoItem[i]); break;
        case 'Music':musicItem.add(todoItem[i]); break;
        case 'Travel':travelItem.add(todoItem[i]); break;
        case 'Study':studyItem.add(todoItem[i]); break;
        case 'Home':homeItem.add(todoItem[i]); break;
        case 'Hobby':hobbyItem.add(todoItem[i]); break;
        case 'Shopping':shoppingItem.add(todoItem[i]); break;
    }
    }
    switch (category) {
      case 'Work': categoryList = workItem; break;
      case 'Music':categoryList = musicItem; break;
      case 'Travel':categoryList = travelItem; break;
      case 'Study':categoryList = studyItem; break;
      case 'Home':categoryList = homeItem; break;
      case 'Hobby':categoryList = hobbyItem; break;
      case 'Shopping':categoryList = shoppingItem; break;
    }
    print(categoryList.length);
  }



  Widget displayReminder (TodoItem todoItem) {
    if ((todoItem.reminder.year) == (DateTime.now().year + 70)) {
      return Text(
        'No reminder',
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
    if (categoryList.length > 0) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Dismissible(
              key: Key(categoryList[index].todo),
              onDismissed: (direction) {
                for (int i = 0; i < todoItem.length; i++) {
                  if (categoryList[index].todo == todoItem[i].todo) {
                    setState(() {
                      todoItem.removeAt(i);
                    });
                  }
                }

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
                            strike(categoryList[index].done, categoryList[index].todo),

                            SizedBox(height: 6.0,),

                            displayReminder(categoryList[index]),
                          ],
                        ),
                      ),

                      IconButton(
                        icon: checkbox(categoryList[index].done),
                        onPressed: () {
                          for (int i = 0; i < todoItem.length; i++) {
                            if (categoryList[index].todo == todoItem[i].todo) {
                              setState(() {
                                todoItem[i].done = !todoItem[i].done;
                              });
                            }
                          }

                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: categoryList.length,
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
    categorise();
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
                '$category Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              background: Image(
                image: AssetImage(image),
              ),
            ),
          ),

          displayList(),

        ],
      ),
    );
  }
}
