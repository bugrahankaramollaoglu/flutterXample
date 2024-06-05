import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// flutter pub add riverpod

/* riverpod, provider'ın gelişmiş ve industry-standard versiyonudur */

// start by creating a provider
final counterProvider = StateProvider<int>((ref) => 0);

class RiverpodExample extends StatefulWidget {
  const RiverpodExample({super.key});

  @override
  State<RiverpodExample> createState() => _RiverpodExampleState();
}

class _RiverpodExampleState extends State<RiverpodExample> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
