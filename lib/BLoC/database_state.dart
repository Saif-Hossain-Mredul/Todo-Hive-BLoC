part of 'database_bloc.dart';

abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}

class DatabaseLoaded extends DatabaseState {
  List taskList;

  DatabaseLoaded({this.taskList});
}
