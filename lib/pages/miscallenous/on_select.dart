import 'package:flutter/material.dart';

class OnSelectExercise extends StatelessWidget {
  const OnSelectExercise({super.key, required this.onTap});

  final void Function() onTap;
  // final VoidCallback? onTap; // alternatif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('On Select Exercise'),
            centerTitle: true,
            floating: true,
            elevation: 0,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ElevatedButton(
                onPressed: onTap,
                child: const Text('click on me'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
