import 'package:flutter/material.dart';
import 'package:zira_bloc/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zira_bloc/bloc/theme.dart';
import 'package:zira_bloc/bloc/user.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Counter myCounter = context.read<Counter>();
    // ThemeBloc myTheme = context.read<ThemeBloc>();
    UserBloc myUser = context.read<UserBloc>();
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: myTheme.state ? Colors.blue : Colors.grey,
          centerTitle: true,
          title: Text(
            'Home Page',
            // style: TextStyle(
            //     color: myTheme.state
            //         ? const Color.fromARGB(255, 115, 115, 115)
            //         : Colors.white),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            //using BlocBuilder will rebuild all widget when the state changes, which quite inefficient compared to blocselector
            // BlocBuilder<UserBloc, Map<String, dynamic>>(
            //   bloc: myUser,
            //   builder: (context, state) {
            //     print("NAME BUILT");
            //     return Text("name: ${state['name']}");
            //   },
            // ),
            // BlocBuilder<UserBloc, Map<String, dynamic>>(
            //   bloc: myUser,
            //   builder: (context, state) {
            //     print("AGE BUILT");
            //     return Text("age: ${state['age']}");
            //   },
            // ),
            BlocSelector<UserBloc, Map<String, dynamic>, String>(
              selector: (state) => state['name'],
              builder: (context, state) {
                print("Name BUILT");
                return Text("name: $state");
              },
            ),
            BlocSelector<UserBloc, Map<String, dynamic>, int>(
              selector: (state) => state['age'],
              builder: (context, state) {
                print("AGE BUILT");
                return Text("name: $state");
              },
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (value) {
                myUser.changeName(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    myUser.changeAge(myUser.state["age"] - 1);
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    myUser.changeAge(myUser.state["age"] + 1);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ));
  }
}
