import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'desk_event.dart';
part 'desk_state.dart';

class DeskBloc extends Bloc<DeskEvent, DeskState> {
  DeskBloc() : super(DeskInitialState()) {
    on<DeskEvent>((event, emit) async {
      emit(DeskLoadingState());
      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder queryTable = supabaseClient.from('desk_user');
        if (event is CreateDeskEvent) {
          await queryTable.insert({
            "name": event.name,
            "email": event.email,
            "phone_number": event.phone,
          });
        }
      } catch (e, s) {
        log("$e\n$s");
        emit(DeskFailureState());
      }
    });
  }
}
