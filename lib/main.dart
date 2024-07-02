import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/app.dart';
import 'package:zira_bloc/bloc/counter.dart';
import 'package:zira_bloc/bloc/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => Counter(),
      ),
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
    ], child: App());
  }
}
