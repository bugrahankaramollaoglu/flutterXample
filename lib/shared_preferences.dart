import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  int num = 0;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    loadNumber();
  }

  Future<void> loadNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      num = prefs.getInt('num-key') ?? 0;
      textEditingController.text = num.toString();
    });
  }

  Future<void> saveNumber(int numb) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('num-key', numb);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'INFO TO SAVE',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Text('$num'),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    num = int.tryParse(value) ?? 0;
                    saveNumber(num);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter a number',
                  labelText: 'Number',
                  prefixIcon: const Icon(Icons.numbers_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  // prefs.remove('num-key'); // spesifik keyi siler
                  prefs.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                  elevation: 7,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: const Text('DELETE'),
            ),
          ],
        ),
      ),
    );
  }
}
