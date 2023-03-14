part of 'doctor_bloc.dart';

@immutable
abstract class DoctorState {}

class DoctorInitialState extends DoctorState {}

class DoctorLoadingState extends DoctorState {}

class DoctorSuccessState extends DoctorState {}

class DoctorfailureState extends DoctorState {}
