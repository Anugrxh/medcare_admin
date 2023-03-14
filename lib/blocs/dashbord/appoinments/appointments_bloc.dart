import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc() : super(AppointmentsInitialstate()) {
    on<AppointmentsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
