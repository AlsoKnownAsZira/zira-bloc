import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Stream<int> countStream() async* { //use async* to create a stream, if asnyc is used, it will expecting a Future
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i; //used to pass the value to the stream
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"), titleTextStyle: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        backgroundColor: const Color.fromARGB(255, 9, 71, 203),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: countStream(),//using the stream
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                
              )
            );
          } else {
            return Center(
              child: Text(
                "${snapshot.data}", //getting the data from the stream
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
