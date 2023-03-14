import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorInitialState()) {
    on<DoctorEvent>((event, emit) async {
      emit(DoctorLoadingState());

      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder queryTable = supabaseClient.from('doctors');

        if (event is CreateDoctorEvent) {
          await queryTable.insert({
            "name": event.name,
            "department_id": event.departmentId,
            "fee": event.fee,
            "time": event.time,
          });
        }
      } catch (e, s) {
        log('$e\n$s');
        emit(DoctorfailureState());
      }
    });
  }
}
