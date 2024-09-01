import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counterEvent.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case CounterEvent.increment:
          emit(state + 1);
          break;
        case CounterEvent.decrement:
          emit(state - 1);
          break;
      }
    });
  }
  @override
  void onChange(Change) {
    print(Change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    print(stackTrace);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
  
   print(transition);
  }
}
