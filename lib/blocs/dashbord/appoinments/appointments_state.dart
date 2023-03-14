part of 'appointments_bloc.dart';

@immutable
abstract class AppointmentsState {}

class AppointmentsInitialstate extends AppointmentsState {}

class AppointmentsLoadingstate extends AppointmentsState {}

class AppointmentsSuccessstate extends AppointmentsState {}

class AppointmentsFailurestate extends AppointmentsState {}
