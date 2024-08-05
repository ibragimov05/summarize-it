import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'monitor_connection_event.dart';
part 'monitor_connection_state.dart';

class MonitorConnectionBloc extends Bloc<MonitorConnectionEvent, MonitorConnectionState> {
  MonitorConnectionBloc() : super(MonitorConnectionInitial()) {
    on<MonitorConnectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
