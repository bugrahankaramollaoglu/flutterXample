import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/pages/state_managements/bloc.dart';
import 'package:flutter_exercise_app/pages/state_managements/provider.dart';
import 'package:flutter_exercise_app/pages/state_managements/riverpod.dart';
import 'package:flutter_exercise_app/pages/state_managements/set_state.dart';
import 'package:flutter_exercise_app/pages/state_managements/stacked.dart';

class StateManagements extends StatelessWidget {
  const StateManagements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              tileColor: Colors.amber,
              title: const Text(
                'SetState',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SetStateExample(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              tileColor: Colors.redAccent,
              title: const Text(
                'Provider',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProviderExample(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              tileColor: Colors.green,
              title: const Text(
                'Riverpod',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiverpodExample(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              tileColor: Colors.blue,
              title: const Text(
                'Stacked',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StackedExample(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              tileColor: Colors.purple,
              title: const Text(
                'Bloc',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BlocExample(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
