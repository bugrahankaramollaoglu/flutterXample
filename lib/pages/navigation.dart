import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/bottom_bar.dart';
import 'package:flutter_exercise_app/navigation_rail.dart';

class NavigationWidgets extends StatefulWidget {
  const NavigationWidgets({super.key});

  @override
  State<NavigationWidgets> createState() => _NavigationWidgetsState();
}

class _NavigationWidgetsState extends State<NavigationWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is AppBar'),
        actions: const [
          Icon(Icons.android),
        ],
        leading: const Icon(Icons.arrow_forward_ios),
        backgroundColor: Colors.blue,
        elevation: 10,
        centerTitle: true,
        automaticallyImplyLeading: false, // Set to false to hide back button
      ),
      bottomNavigationBar: const BottomBar(),
      body: const Row(
        children: [
          Expanded(child: navigationRail()),
        ],
      ),
    );
  }
}
