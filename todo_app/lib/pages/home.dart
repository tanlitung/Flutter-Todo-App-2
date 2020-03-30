import 'package:flutter/material.dart';
import 'package:todoapp/pages/home_page_icon.dart';
import 'package:todoapp/pages/task_category.dart';
import 'package:todoapp/todotasks.dart';
import 'package:todoapp/pages/all_tasks.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TodoItem> todoItem = List<TodoItem>();
  TodoItem temp;
  var tasksNumber = {'All': 0, 'Work': 0, 'Home': 0, 'Hobby': 0, 'Travel': 0, 'Study': 0, 'Shopping': 0, 'Music': 0};

  void calculateTasksNumber () {
    tasksNumber['Work'] = 0;
    tasksNumber['Music'] = 0;
    tasksNumber['Travel'] = 0;
    tasksNumber['Study'] = 0;
    tasksNumber['Home'] = 0;
    tasksNumber['Hobby'] = 0;
    tasksNumber['Shopping'] = 0;
    tasksNumber['All'] = todoItem.length;
    for (int i = 0; i < todoItem.length; i++) {
      switch (todoItem[i].category) {
        case 'Work': tasksNumber['Work']++; break;
        case 'Music': tasksNumber['Music']++; break;
        case 'Travel': tasksNumber['Travel']++; break;
        case 'Study': tasksNumber['Study']++; break;
        case 'Home': tasksNumber['Home']++; break;
        case 'Hobby': tasksNumber['Hobby']++; break;
        case 'Shopping': tasksNumber['Shopping']++; break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xEFFCFCFC),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: const Color(0xFF5786FF),
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/addTasks');
          setState(() {
            temp = new TodoItem(todo: result['todo'], category: result['category'], note: result['note'], done: result['done'], reminder: result['reminder']);
            todoItem.add(temp);
            calculateTasksNumber();
          });
          print(todoItem.length);
          for (int i = 0; i < todoItem.length; i++){
            print('${todoItem[i].todo} : ${todoItem[i].reminder} : ${todoItem[i].note} : ${todoItem[i].category} : ${todoItem[i].done}');
          }
          },
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    SizedBox(width: 25.0,),
                    Icon(
                        Icons.subject,
                      size: 40.0,
                    ),
                  ],
              ),
              SizedBox(height: 15.0,),
              Row(
                children: <Widget>[
                  SizedBox(width: 25.0,),

                  Text(
                    'Lists',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      dynamic todoResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllTasks(todoItem: todoItem)
                        ),
                      );
                      setState(() {
                        todoItem = todoResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'All', number: tasksNumber['All'], todoItem: todoItem,),
                  ),

                  InkWell(
                    onTap: () async {
                      dynamic workResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCategory(todoItem: todoItem, image: 'assets/work.png', category: 'Work',)
                        ),
                      );
                      setState(() {
                        todoItem = workResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'Work', number: tasksNumber['Work'], todoItem: todoItem,),
                  ),
                ],
              ),
              SizedBox(height: 15.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      dynamic musicResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCategory(todoItem: todoItem, image: 'assets/music.png', category: 'Music',)
                        ),
                      );
                      setState(() {
                        todoItem = musicResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'Music', number: tasksNumber['Music'], todoItem: todoItem,),
                  ),

                  InkWell(
                    onTap: () async {
                      dynamic travelResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCategory(todoItem: todoItem, image: 'assets/travel.png', category: 'Travel',)
                        ),
                      );
                      setState(() {
                        todoItem = travelResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'Travel', number: tasksNumber['Travel'], todoItem: todoItem,),
                  ),

                ],
              ),
              SizedBox(height: 15.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      dynamic studyResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCategory(todoItem: todoItem, image: 'assets/study.png', category: 'Study',)
                        ),
                      );
                      setState(() {
                        todoItem = studyResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'Study', number: tasksNumber['Study'], todoItem: todoItem,),
                  ),

                  InkWell(
                    onTap: () async {
                      dynamic homeResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCategory(todoItem: todoItem, image: 'assets/home.png', category: 'Home',)
                        ),
                      );
                      setState(() {
                        todoItem = homeResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'Home', number: tasksNumber['Home'], todoItem: todoItem,),
                  ),
                ],
              ),
              SizedBox(height: 15.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      dynamic hobbyResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCategory(todoItem: todoItem, image: 'assets/hobby.png', category: 'Hobby',)
                        ),
                      );
                      setState(() {
                        todoItem = hobbyResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'Hobby', number: tasksNumber['Hobby'], todoItem: todoItem,),
                  ),

                  InkWell(
                    onTap: () async {
                      dynamic shoppingResult = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TasksCategory(todoItem: todoItem, image: 'assets/shopping.png', category: 'Shopping',)
                        ),
                      );
                      setState(() {
                        todoItem = shoppingResult;
                        calculateTasksNumber();
                      });
                    },
                    child: HomePageIcon(text:'Shopping', number: tasksNumber['Shopping'], todoItem: todoItem,),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
