import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/popup_menu.dart';

class SelectionWidgets extends StatefulWidget {
  const SelectionWidgets({super.key});

  @override
  State<SelectionWidgets> createState() => _SelectionWidgetsState();
}

class _SelectionWidgetsState extends State<SelectionWidgets> {
  bool? isChecked = false;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  SampleItem? selectedItem;
  double? selectedRate = 0.0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime!,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('checkbox'),
              Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
              const SizedBox(height: 20),
              const Text('chip'),
              const Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                ),
                label: Text('this is chip'),
              ),
              const SizedBox(height: 20),
              Text('today is -> $selectedDate'),
              IconButton.outlined(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(Icons.date_range),
              ),
              const SizedBox(height: 20),
              Text('time is -> $selectedTime'),
              IconButton.outlined(
                onPressed: () {
                  _selectTime(context);
                },
                icon: const Icon(Icons.watch),
              ),
              const SizedBox(height: 20),
              Text('Popup menu: $selectedItem'),
              popupMenu(),
              slider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
      value: selectedRate!,
      max: 100,
      min: 0,
      // divisions: 5,
      label: selectedRate!.round().toString(),
      onChanged: (double value) {
        setState(() {
          selectedRate = value;
        });
      },
    );
  }

  Widget popupMenu() {
    return PopupMenuButton<SampleItem>(
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('Item 1'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('Item 2'),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemThree,
          child: Text('Item 3'),
        ),
      ],
    );
  }
}
