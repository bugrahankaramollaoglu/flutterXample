import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemCount: 20, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          // Return a grid tile with a text label
          return GridTile(
            child: Container(
              color: Colors.blueGrey[200],
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
