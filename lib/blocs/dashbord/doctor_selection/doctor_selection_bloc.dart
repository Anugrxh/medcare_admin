import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'doctor_selection_event.dart';
part 'doctor_selection_state.dart';

class DoctorSelectionBloc
    extends Bloc<DoctorSelectionEvent, DoctorSelectionState> {
  DoctorSelectionBloc() : super(DoctorSelectionInitialState()) {
    on<DoctorSelectionEvent>((event, emit) async {
      emit(DoctorSelectionLoadingState());
      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder queryTable = supabaseClient.from('doctors');
        List<Map<String, dynamic>> doctors = await queryTable.select('*');
      } catch (e, s) {
        log("$e\n$s");
        emit(DoctorSelectionfailureState());
      }
    });
  }
}
