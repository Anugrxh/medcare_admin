import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc() : super(DepartmentInitialState()) {
    on<DepartmentEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder queryTable = supabaseClient.from('departments');
        List<Map<String, dynamic>> departments = await queryTable.select('*');
      } catch (e, s) {
        log("$e\n$s");
        emit(DepartmentFailureState());
      }
    });
  }
}
