import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive_db/utilities/task-model.utilities.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(DatabaseInitial());

  @override
  Stream<DatabaseState> mapEventToState(
    DatabaseEvent event,
  ) async* {
    await Hive.openBox('tasks');
    final taskbox = Hive.box('tasks');

    if (event is InitEvent) {
      final tasks = taskbox.values.toList();
      yield DatabaseLoaded(taskList: tasks);
    } else if (event is InsertEvent) {
      taskbox.add(event.task);
      final tasks = taskbox.values.toList();
      yield DatabaseLoaded(taskList: tasks);
    } else if (event is UpdateEvent) {
      taskbox.putAt(event.index, event.task);
      final tasks = taskbox.values.toList();
      yield DatabaseLoaded(taskList: tasks);
    } else if (event is DeleteEvent) {
      taskbox.deleteAt(event.index);
      final tasks = taskbox.values.toList();
      yield DatabaseLoaded(taskList: tasks);
    }

    taskbox.close();
  }
}
