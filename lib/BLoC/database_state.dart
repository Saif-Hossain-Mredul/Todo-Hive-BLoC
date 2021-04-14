part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();
}

class DatabaseInitial extends DatabaseState {
  @override
  List<Object> get props => [];
}
