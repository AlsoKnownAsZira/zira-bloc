import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/counter.dart';
import 'package:zira_bloc/widgets/data_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                color: Colors.red,
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<Counter>(context).decrementData();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // data widget that shows the current state of the counter
              DataWidget(),
              Material(
                color: Colors.red,
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<Counter>(context).incrementData();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/second');},
              label: const Text("Navigate to next page ->"))
        ]));
  }
}
