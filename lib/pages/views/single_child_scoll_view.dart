import 'package:flutter/material.dart';

class SingleChildScrollViewExample extends StatelessWidget {
  const SingleChildScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => ListTile(
              title: Text('Item $index'),
              subtitle: Text('Subtitle $index'),
              leading: const Icon(Icons.star),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item $index tapped'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SingleChildScrollViewExample(),
  ));
}
