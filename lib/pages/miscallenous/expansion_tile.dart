import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/exercise_app.dart';

class Expansion_Tile extends StatelessWidget {
  const Expansion_Tile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Tile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          ExpansionTile(
              title: const Text('expansion tile deneme 1'),
              children: [
                ListTile(
                  title: const Text('Expansion Tile 1 [CLICKABLE]'),
                  onTap: () => print('clicked Expansion Tile 1'),
                  tileColor: Colors.green,
                ),
                const ListTile(
                  title: Text('Expansion Tile 2 [disabled]'),
                  enabled: false,
                ),
                const ListTile(
                  title: Text('Expansion Tile 3'),
                  textColor: Colors.red,
                  subtitle: Text('Alt Metin'),
                  iconColor: Colors.blue,
                ),
              ]),
          const SizedBox(height: 50),
          const ExpansionTile(
              title: Text('expansion tile deneme 2'),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomCard('List 1', ExerciseApp()),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomCard('List 2', ExerciseApp()),
                ),
              ]),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Widget page;

  const CustomCard(this.title, this.page, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Colors.orange,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {},
      ),
    );
  }
}
