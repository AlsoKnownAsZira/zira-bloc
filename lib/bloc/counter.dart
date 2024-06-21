import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  int initialData;
  Counter({this.initialData = 0}): super(initialData); //initialdata is optional, we can use super(0) as well, but this approach is more readable

  void incrementData() {
    emit(state + 1); //no need to use yield
  }

  void decrementData() {
    emit(state - 1);
  }

  @override 
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}