import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_hive_db/BLoC/database_bloc.dart';
import 'package:todo_hive_db/utilities/task-model.utilities.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final index;

  TaskTile({this.task, this.index});

  @override
  Widget build(BuildContext context) {
    final _databaseBloc = BlocProvider.of<DatabaseBloc>(context);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            _databaseBloc.add(DeleteEvent(index: index));
          },
        ),
      ],
      child: ListTile(
        title: Text(
          '${task.title}',
          style: TextStyle(
              decoration: task.status == 1
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        subtitle: Text(
          '${DateFormat('MMM dd, yyyy').format(task.createdAt)} ⚫ ${task.priority}',
          style: TextStyle(
              decoration: task.status == 1
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Checkbox(
          value: task.status == 1 ? true : false,
          onChanged: (newVal) {
            task.status = newVal ? 1 : 0;
            _databaseBloc.add(UpdateEvent(index: index, task: task));
          },
        ),
      ),
    );
  }
}
