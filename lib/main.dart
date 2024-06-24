import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/pages/home_page.dart';
import 'package:zira_bloc/bloc/counter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: BlocProvider(
        create: (context) => Counter(),
        child: const HomePage(),
      ),
    );
  }
}
