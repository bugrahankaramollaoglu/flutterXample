import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/pages/miscallenous/bottom_bar.dart';
import 'package:flutter_exercise_app/pages/miscallenous/custom_bottom_bar.dart';
import 'package:flutter_exercise_app/pages/miscallenous/drawer.dart';
import 'package:flutter_exercise_app/pages/miscallenous/expansion_tile.dart';
import 'package:flutter_exercise_app/pages/miscallenous/fade_in_image.dart';
import 'package:flutter_exercise_app/pages/miscallenous/ink_well.dart';
import 'package:flutter_exercise_app/pages/miscallenous/on_select.dart';
import 'package:flutter_exercise_app/pages/miscallenous/search_bar.dart';
import 'package:flutter_exercise_app/pages/miscallenous/sonra.dart';
import 'package:flutter_exercise_app/pages/miscallenous/stack.dart';
import 'package:flutter_exercise_app/shared_preferences.dart';

class MiscalleniousWidgets extends StatefulWidget {
  const MiscalleniousWidgets({super.key});

  @override
  _MiscalleniousWidgetsState createState() => _MiscalleniousWidgetsState();
}

class _MiscalleniousWidgetsState extends State<MiscalleniousWidgets> {
  // Define your list of items
  final List<String> items = [
    'Shared Preferences',
    'Expansion Tile',
    'OnSelected Exercise',
    'InkWell',
    'Stack',
    'FadeIn Image',
    'BottomBar',
    'Drawer',
    'Custom Buttom Bar',
    'Search Bar',
    'SONRA',
  ];

  void _onTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Button tapped!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Function to handle item tap
  void _onItemTap(int index) {
    // Navigate to the corresponding page based on the index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SharedPref()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Expansion_Tile()),
        );
        break;

      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OnSelectExercise(
                    onTap: _onTap,
                  )),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InkWellExampleApp()),
        );
        break;

      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StackWidget()),
        );
        break;

      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FadeinImage()),
        );

      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBarNav()),
        );

      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Drawers()),
        );

      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomBottomBar()),
        );

      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Searchbar()),
        );

      case 10:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Sonra()),
        );



      // Add more cases for additional pages
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(items[index]),
                onTap: () => _onItemTap(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
