part of 'database_bloc.dart';

abstract class DatabaseEvent {}

class InitEvent extends DatabaseEvent {}

class InsertEvent extends DatabaseEvent {
  final Task task;

  InsertEvent({@required this.task});
}

class UpdateEvent extends DatabaseEvent {
  final Task task;
  final int index;

  UpdateEvent({@required this.task, @required this.index});
}

class DeleteEvent extends DatabaseEvent {
  final int index;

  DeleteEvent({@required this.index});
}
