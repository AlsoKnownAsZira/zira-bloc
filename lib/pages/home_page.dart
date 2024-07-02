import 'package:flutter/material.dart';
import 'package:zira_bloc/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/theme.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myTheme.state ? Colors.blue : Colors.grey,
        centerTitle: true,
      title: Text(
    'Home Page',
    style: TextStyle(color: myTheme.state ? const Color.fromARGB(255, 115, 115, 115) : Colors.white),
  ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<Counter, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.decrementData();
                    },
                    icon: Icon(Icons.remove)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      myCounter.incrementData();
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  myTheme.changeTheme();
                },
                child: Text("Change Theme")),
          ],
        ),
      ),
    );
  }
}
