part of 'desk_bloc.dart';

@immutable
abstract class DeskState {}

class DeskInitialState extends DeskState {}

class DeskLoadingState extends DeskState {}

class DeskSuccessState extends DeskState {}

class DeskFailureState extends DeskState {}
