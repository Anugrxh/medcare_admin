part of 'doctor_selection_bloc.dart';

@immutable
abstract class DoctorSelectionState {}

class DoctorSelectionInitialState extends DoctorSelectionState {}

class DoctorSelectionLoadingState extends DoctorSelectionState {}

class DoctorSelectionSuccessState extends DoctorSelectionState {}

class DoctorSelectionfailureState extends DoctorSelectionState {}
