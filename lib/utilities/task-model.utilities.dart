import 'package:hive/hive.dart';

part 'task-model.utilities.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  String priority;

  @HiveField(4)
  int status;

  Task({this.title, this.id, this.createdAt, this.status, this.priority});
}
