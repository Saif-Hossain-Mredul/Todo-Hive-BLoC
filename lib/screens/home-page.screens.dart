import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_hive_db/BLoC/database_bloc.dart';
import 'package:todo_hive_db/widgets/home-screen-body.widgets.dart';

import 'add-task-screen.screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _databaseBloc = BlocProvider.of<DatabaseBloc>(context);

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
            CupertinoPageRoute(
              builder: (_) => BlocProvider.value(
                value: _databaseBloc,
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 60, bottom: 5),
          child: BlocBuilder<DatabaseBloc, DatabaseState>(
            builder: (context, state) {
              return state is DatabaseLoaded
                  ? HomeScreenBody(
                      taskList: state.taskList,
                    )
                  : Center(
                      child: Icon(
                        Icons.list_alt,
                        color: Colors.deepOrange,
                        size: 80,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
