import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive_db/utilities/task-model.utilities.dart';
import 'package:todo_hive_db/widgets/task-tile.widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  Box taskBox;

  getCompletedTaskCount() {
    final allTasks = taskBox.values;
    return allTasks.where((task) => task.status == 1).toList().length;
  }

  @override
  void initState() {
    taskBox  = Hive.box('tasks');
    super.initState();
  }

  @override
  void dispose() {
    taskBox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'My tasks',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            '${getCompletedTaskCount()} of ${taskBox.length}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: taskBox.listenable(),
            builder: (context, box, widget) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final task = box.getAt(index) as Task;

                  return TaskTile(
                    task: task,
                    index: index,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
