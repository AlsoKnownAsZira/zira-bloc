import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/counter.dart';
import 'package:zira_bloc/bloc/counterEvent.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CounterBloc counterB = CounterBloc(0);
  int value = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Counter App with bloc',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent.shade400,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              bloc: counterB,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    counterB.add(DecrementEvent(0));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    counterB.add(IncrementEvent(0));
                  },
                ),
              ],
            ),
                const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    counterB.add(DecrementByValueEvent(value));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () {
                    counterB.add(IncrementByValueEvent(value));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
