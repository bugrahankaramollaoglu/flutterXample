import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      backgroundColor: Colors.lightBlue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedFontSize: 16,
      elevation: 20,
      onTap: null,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'THIS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'IS',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'BOTTOM BAR',
        ),
      ],
    );
  }
}
