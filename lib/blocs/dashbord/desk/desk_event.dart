part of 'desk_bloc.dart';

@immutable
abstract class DeskEvent {}

class CreateDeskEvent extends DeskEvent {
  final String name, phone, email;

  CreateDeskEvent(
      {required this.name, required this.phone, required this.email});
}

class EditDeskEvent extends DeskEvent {
  final String name, phone;
  final int deskId;

  EditDeskEvent(
      {required this.name, required this.phone, required this.deskId});
}

class RemoveDeskEvent extends DeskEvent {
  final int deskId;

  RemoveDeskEvent({required this.deskId});
}

class GetAllDeskEvent extends DeskEvent {}
