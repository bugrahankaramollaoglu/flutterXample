import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  String query = "";

  TextEditingController textEditingController = TextEditingController();

  List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Pineapple',
    'Grapes',
    'Watermelon',
  ];

  @override
  Widget build(BuildContext context) {
    List<String> searchResults = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: "Ara",
                  hintText: "Ara",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text('Search results: $searchResults'),
          ],
        ),
      ),
    );
  }
}
