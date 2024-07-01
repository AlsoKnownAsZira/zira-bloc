import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/counter.dart';
import 'package:zira_bloc/pages/home_page.dart';
import 'package:zira_bloc/pages/not_found.dart';
import 'package:zira_bloc/pages/second_page.dart';


class MyRouter {
  final Counter mycounter = Counter();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: const HomePage(),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: mycounter,
            child: const SecondPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }
}
