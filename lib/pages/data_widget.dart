import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.myCounter,
  });

  final Counter myCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      width: 200,
      child: Center(
        child: BlocBuilder<Counter, int>(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              state.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
