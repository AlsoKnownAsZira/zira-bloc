import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counterEvent.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initial) : super(initial) {
    on<DecrementEvent>((event, emit) {
      emit((state - 1));
    });
    on<IncrementEvent>((event, emit) {
      emit((state + 1));
    });
    on<IncrementByValueEvent>((event, emit) {
      emit((state + event.value));
    });
    on<DecrementByValueEvent>((event, emit) {
      emit((state - event.value));
    });
  }
//
}
