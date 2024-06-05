
import 'package:flutter/material.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  Widget activeScreen = Container();

  void _setActiveScreen(int drawerIndex) {
    setState(() {
      activeScreen = _buildPage(drawerIndex);
    });
  }

  Widget _buildPage(int drawerIndex) {
    return Center(
      child: Text('Screen $drawerIndex'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: activeScreen,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                _setActiveScreen(1);
                Navigator.pop(context); // Close the drawer after selecting
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                _setActiveScreen(2);
                Navigator.pop(context); // Close the drawer after selecting
              },
            ),
          ],
        ),
      ),
    );
  }
}
