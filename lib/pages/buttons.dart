import 'package:flutter/material.dart';
import '../toast.dart';

class ButtonWidgets extends StatefulWidget {
  const ButtonWidgets({super.key});

  @override
  State<ButtonWidgets> createState() => _ButtonsState();
}

class _ButtonsState extends State<ButtonWidgets> {
  bool isButtonClicked = false;
  bool isSwitched = false;
  List<bool> isSelected = [false, false, false]; // List to track selection

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = [
      ElevatedButton(
        onPressed: () {
          // showToast void oldugundan böyle kullanmalısın, direkt kullanamazsın
          showToast('Clicked on Elevated Button');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 7,
        ),
        child: const Text('Elevated Button'),
      ),
      TextButton(
        onPressed: () {
          showToast('Clicked on Text Button');
          setState(() {
            isButtonClicked = !isButtonClicked;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          isButtonClicked ? 'TextButton Clicked' : 'TextButton Not\nclicked',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      OutlinedButton(
        onPressed: () {
          showToast('Clicked on Outlined Button');
        },
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(
              Colors.white), // Set the foreground color
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.red; // Color when pressed
            }
            return Colors.blue; // Default color
          }),
        ),
        child: const Text('Outlined Button'),
      ),
      IconButton(
        onPressed: () {
          showToast('Clicked on Outlined Button');
        },
        icon: const Icon(Icons.menu),
        tooltip: 'Increase volume by 10',
      ),
      FilledButton(
        onPressed: () {
          showToast('Clicked on Filled Button');
        },
        child: const Text('Filled Button'),
      ),
      ToggleButtons(
        onPressed: (int index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
        isSelected: isSelected,
        children: const <Widget>[
          Icon(Icons.toggle_on),
          Icon(Icons.android),
          Icon(Icons.toggle_off),
        ],
      ),
      Switch(
        // This bool value toggles the switch.
        value: isSwitched,
        activeColor: Colors.red,
        onChanged: (bool value) {
          // This is called when the user toggles the switch.
          setState(() {
            isSwitched = value;
          });
        },
      ),
      FilledButton.tonal(
        onPressed: () {
          showToast('Clicked on Filled Button Tonal');
        },
        child: const Text('Filled Button Tonal'),
      ),
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showToast('Clicked on Floating Action Button');
        },
        label: const Row(
          children: [Icon(Icons.add), Text('ADD')],
        ),
      ),
      body: GridView.builder(
        itemCount: gridItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemBuilder: (ctx, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gridItems[index],
              ],
            ),
          );
        },
      ),
    );
  }
}
