import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc() : super({"name": "-", "age": 0}); //declaring the super value

  void changeName(String newName) {
    emit({"name": newName, "age": state["age"]});
  }

  void changeAge(int newAge) {
    emit({"name": state["name"], "age": newAge});
  }
}
