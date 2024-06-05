import 'package:flutter/material.dart';

class BottomBarNav extends StatefulWidget {
  const BottomBarNav({super.key});

  @override
  State<BottomBarNav> createState() => _BottomBarNavState();
}

class _BottomBarNavState extends State<BottomBarNav> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const Center(
          child: Text('Screen 1'),
        );
      case 1:
        return const Center(
          child: Text('Screen 2'),
        );
      default:
        return Container(); // Handle other cases if needed
    }
  }

  final List<BottomNavigationBarItem> _navItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Add',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: 'Star',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Bar Navigation'),
      ),
      body: _buildPage(_selectedPageIndex),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage, // Assign onTap function
          currentIndex: _selectedPageIndex, // Reflect current index
          items: _navItems),
    );
  }
}
