import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/counter.dart';

class HomePage extends StatelessWidget {
  final Counter myCounter = Counter(
      initialData: 0); // initialize the counter using the Counter class
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
            BlocBuilder<Counter,int>(

              bloc: myCounter,// which bloc to use
              // a function to make conditional building, the values still change but the UI does not rebuild
              buildWhen: (previous, current) {
                if (current % 2 == 0) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                return Text(
                  "$state", // display the data from the stream
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                );
              },
            ),
            // StreamBuilder(
            //   stream: myCounter.stream,
            //   initialData: myCounter.initialData,
            //   builder: (context, snapshot) {
            //     return Center(
            //       child: Text(
            //         "${snapshot.data}", //display the data from the stream
            //         style: const TextStyle(
            //           fontSize: 50,
            //         ),
            //       ),
            //     );
            //   },
            // ),

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
