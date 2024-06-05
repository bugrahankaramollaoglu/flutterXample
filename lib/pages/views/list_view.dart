import 'package:flutter/material.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('sss $index'),
            onTap: () {
              // Show a toast message when the ListTile is tapped
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item $index tapped'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
