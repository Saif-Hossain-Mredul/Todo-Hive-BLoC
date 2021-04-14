part of 'database_bloc.dart';

abstract class DatabaseEvent{
}

class InsertEvent extends DatabaseEvent {
  final Task task;

  InsertEvent({@required this.task});
}

class UpdateEvent extends DatabaseEvent {
  final Task task;

  UpdateEvent({@required this.task});
}

class DeleteEvent extends DatabaseEvent {
  final Task task;

  DeleteEvent({@required this.task});
}
