import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/counter.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
Counter counter = context.read<Counter>();
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: const Color.fromARGB(255, 9, 71, 203),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [ BlocBuilder(bloc: counter, builder: (context, state) {
            return Text(
              state.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            );
          },),
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
                ),
          ],
          
         
        ),
      ),
    );
  }
}