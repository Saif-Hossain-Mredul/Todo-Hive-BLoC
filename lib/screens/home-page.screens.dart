import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive_db/widgets/home-screen-body.widgets.dart';

import 'add-task-screen.screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box taskBox;

  @override
  void initState() {
    taskBox = Hive.box('tasks');
    super.initState();
  }

  @override
  void dispose() {
    taskBox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => AddTaskScreen()),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 60, bottom: 5),
          child: HomeScreenBody(),
        ),
      ),
    );
  }
}
