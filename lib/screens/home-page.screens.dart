import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add-task-screen.screen.dart';

class HomePage extends StatelessWidget {
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
                context, MaterialPageRoute(builder: (_) => AddTaskScreen()));
          },
        ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}