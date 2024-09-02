import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/pages/home.dart';
import 'package:zira_bloc/general_observer.dart';

void main() {
Bloc.observer = MyObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {   
    return  MaterialApp(
      
      home: HomePage(),
    );
  }
}
