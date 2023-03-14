part of 'department_bloc.dart';

@immutable
abstract class DepartmentEvent {}

class GetAllDEpartmentEvent extends DepartmentEvent {
  final int? departmentId;

  GetAllDEpartmentEvent({required this.departmentId});
}
