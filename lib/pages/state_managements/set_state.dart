import 'package:flutter/material.dart';

/* setState is used to manage state changes in a StatefulWidget.
When you call setState, Flutter re-renders the widget with the
updated state. Here’s a step-by-step guide to using setState in Flutter: */

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  State<SetStateExample> createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Butona su kadar bastiniz:\n\n'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'dude, click me!',
        child: const Icon(Icons.add),
      ),
    );
  }
}
