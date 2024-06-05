import 'package:flutter/material.dart';

class navigationRail extends StatefulWidget {
  const navigationRail({super.key});

  @override
  _navigationRailState createState() => _navigationRailState();
}

class _navigationRailState extends State<navigationRail> {
  int _selectedIndex = 0;

  static const List<NavigationRailDestination> _destinations = [
    NavigationRailDestination(
      icon: Icon(Icons.home),
      label: Text('Home'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.search),
      label: Text('Search'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.notifications),
      label: Text('Notifications'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.person),
      label: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: _destinations,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text('THIS IS NAVIGATION RAIL $_selectedIndex'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
