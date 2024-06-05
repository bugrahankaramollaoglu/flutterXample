import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/pages/views/grid_view.dart';
import 'package:flutter_exercise_app/pages/views/list_view.dart';
import 'package:flutter_exercise_app/pages/views/single_child_scoll_view.dart';

class Views extends StatefulWidget {
  const Views({super.key});

  @override
  State<Views> createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  late Widget selectedWidget = Container(); // Declare selectedWidget here

  @override
  void initState() {
    super.initState();
    selectedWidget = const ListViewExample(); // Set default widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChoice(
                    onSelectionChanged: (widget) {
                      setState(() {
                        selectedWidget = widget; // Update selectedWidget
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: selectedWidget, // Use selectedWidget here
          ),
        ],
      ),
    );
  }
}

class SingleChoice extends StatefulWidget {
  final Function(Widget) onSelectionChanged;

  const SingleChoice({super.key, required this.onSelectionChanged});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  late Widget selectedWidget;

  @override
  void initState() {
    super.initState();
    selectedWidget = const ListViewExample(); // Set default widget
  }

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Widget>(
      segments: const <ButtonSegment<Widget>>[
        ButtonSegment<Widget>(
          value: ListViewExample(),
          label: Text('ListView'),
          icon: Icon(Icons.list),
        ),
        ButtonSegment<Widget>(
          value: GridViewExample(),
          label: Text('GridView'),
          icon: Icon(Icons.grid_3x3),
        ),
        ButtonSegment<Widget>(
          value: SingleChildScrollViewExample(),
          label: Text('Single Child Scroll View'),
          icon: Icon(Icons.swipe_down),
        ),
      ],
      selected: <Widget>{selectedWidget},
      onSelectionChanged: (Set<Widget> newSelection) {
        setState(() {
          selectedWidget = newSelection.first; // Update selectedWidget
          widget.onSelectionChanged(selectedWidget);
        });
      },
    );
  }
}
