import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('InkWell Example'),
            InkWell(
              onTap: () {
                print('Container tapped!');
              },
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Tap Me'),
              ),
            ),
            const Divider(
              indent: 50,
              endIndent: 50,
              color: Colors.black,
            ),
            
          ],
        ),
      ),
    );
  }
}
