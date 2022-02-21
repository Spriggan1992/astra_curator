import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'adding_client_event.dart';
part 'adding_client_state.dart';
part 'adding_client_bloc.freezed.dart';

class AddingClientBloc extends Bloc<AddingClientEvent, AddingClientState> {
  AddingClientBloc() : super(_Initial()) {
    on<AddingClientEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
