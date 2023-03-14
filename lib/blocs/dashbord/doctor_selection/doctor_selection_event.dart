part of 'doctor_selection_bloc.dart';

@immutable
abstract class DoctorSelectionEvent {}

class GetAllDoctorSelectionEvent extends DoctorSelectionEvent {
  final int doctorId;

  GetAllDoctorSelectionEvent({required this.doctorId});
}
