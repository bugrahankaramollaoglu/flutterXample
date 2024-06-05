// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/pages/buttons.dart';
import 'package:flutter_exercise_app/pages/communication.dart';
import 'package:flutter_exercise_app/pages/containment.dart';
import 'package:flutter_exercise_app/firebase/login_page.dart';
import 'package:flutter_exercise_app/pages/miscallenous/miscallenious.dart';
import 'package:flutter_exercise_app/pages/navigation.dart';
import 'package:flutter_exercise_app/pages/selection.dart';
import 'package:flutter_exercise_app/pages/state_managements/state_managements.dart';
import 'package:flutter_exercise_app/pages/views/views.dart';

class ExerciseApp extends StatefulWidget {
  const ExerciseApp({super.key});

  @override
  State<ExerciseApp> createState() => _ExerciseAppState();
}

class _ExerciseAppState extends State<ExerciseApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 8, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    signOut(context);
                  },
                  icon: const Icon(Icons.logout)),
            ],
            title: Text('Flutter Exercises App'),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              dividerColor: Colors.white,
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.blueGrey,
              labelColor: Colors.blue,
              tabs: [
                Tab(
                  icon: Icon(Icons.radio_button_checked),
                  text: 'Buttons',
                ),
                Tab(
                  icon: Icon(Icons.view_agenda),
                  text: 'Views',
                ),
                Tab(
                  icon: Icon(Icons.phone),
                  text: 'Communication',
                ),
                Tab(
                  icon: Icon(Icons.storage),
                  text: 'Containment',
                ),
                Tab(
                  icon: Icon(Icons.navigation),
                  text: 'Navigation',
                ),
                Tab(
                  icon: Icon(Icons.select_all_outlined),
                  text: 'Selection',
                ),
                Tab(
                  icon: Icon(Icons.update_sharp),
                  text: 'State Managements',
                ),
                Tab(
                  icon: Icon(Icons.miscellaneous_services),
                  text: 'Miscallenious',
                ),

              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const TabBarView(
              children: [
                ButtonWidgets(),
                Views(),
                CommunicationWidgets(),
                ContainmentWidgets(),
                NavigationWidgets(),
                SelectionWidgets(),
                StateManagements(),
                MiscalleniousWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
