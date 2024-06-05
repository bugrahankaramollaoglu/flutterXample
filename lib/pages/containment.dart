import 'package:flutter/material.dart';

class ContainmentWidgets extends StatefulWidget {
  const ContainmentWidgets({super.key});

  @override
  State<ContainmentWidgets> createState() => _ContainmentWidgetsState();
}

class _ContainmentWidgetsState extends State<ContainmentWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                text: 'Alert Dialog',
              ),
              const SizedBox(width: 20),
              CustomElevatedButton(
                onPressed: () {
                  showBottomSheet(context);
                },
                text: 'Bottom Sheet',
              ),
            ],
          ),
          const SizedBox(height: 20),
          _divider(),
          const Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Card',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'This is a card widget.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _divider(),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('List Tile'),
            subtitle: const Text('This is a list tile widget.'),
            isThreeLine: true,
            dense: true,
            enabled: true,
            selected: false,
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {},
            onLongPress: () {},
          ),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // return CupertinoAlertDialog(
        return AlertDialog(
          title: const Text('Alert Dialog'),
          content: const Text('This is a decent alert dialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Perform action when "Yes" is pressed
                Navigator.of(context).pop();
                // Add your logic here
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Bottom Sheet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.star),
                  trailing: const Icon(Icons.arrow_forward),
                  title: const Text('Option 1'),
                  onTap: () {
                    // Handle option 1
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star_border),
                  title: const Text('Option 2'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle option 2
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star_half),
                  trailing: const Icon(Icons.arrow_forward),
                  title: const Text('Option 3'),
                  onTap: () {
                    // Handle option 3
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _divider() {
  return const Divider(
    height: 10,
    thickness: 2,
    indent: 20,
    endIndent: 20,
    color: Colors.black,
  );
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 7,
      ),
      child: Text(text),
    );
  }
}
