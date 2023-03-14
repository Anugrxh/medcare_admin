part of 'doctor_bloc.dart';

@immutable
abstract class DoctorEvent {}

class CreateDoctorEvent extends DoctorEvent {
  final String name, time;
  final int departmentId, fee;

  CreateDoctorEvent({
    required this.name,
    required this.time,
    required this.departmentId,
    required this.fee,
  });
}

class EditDoctorEvent extends DoctorEvent {
  final String name, time;
  final int departmentId, fee, doctorId;

  EditDoctorEvent({
    required this.name,
    required this.time,
    required this.departmentId,
    required this.fee,
    required this.doctorId,
  });
}

class RemoveDoctorEvent extends DoctorEvent {
  final int doctorId;

  RemoveDoctorEvent({required this.doctorId});
}

class GetAllDoctorEvent extends DoctorEvent {}
