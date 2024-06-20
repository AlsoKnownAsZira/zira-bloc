import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  int initialData;
  CounterCubit({this.initialData = 0})
      : super(
            initialData); //initialdata is optional, we can use super(0) as well, but this approach is more readable

  void incrementData() {
    emit(state + 1); //no need to use yield
  }

  void decrementData() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter =
      CounterCubit(); // initialize the counter using the CounterCubit class
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: const Color.fromARGB(255, 9, 71, 203),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: myCounter.stream,
              initialData: myCounter.initialData,
              builder: (context, snapshot) {
                return Center(
                  child: Text(
                    "${snapshot.data}", //display the data from the stream
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    myCounter.decrementData();
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    myCounter.incrementData();
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
