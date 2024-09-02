import 'package:bloc/bloc.dart';

class MyObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);

  }
}