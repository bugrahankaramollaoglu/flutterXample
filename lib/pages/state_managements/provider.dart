import 'package:flutter/material.dart';

// flutter pub add provider

/* context.watch context.read gibi ek özellikleri de var */

// create a class that holds the state extending ChangeNotifier
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

/* you should wrap your main() like (şimdilik hata veriyor)

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

 */

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Consumer<Counter>(
            //   builder: (context, counter, child) {
            //     return Text(
            //       '${counter.count}',
            //       style: Theme.of(context).textTheme.headlineLarge,
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   onPressed: () {
          //     Provider.of<Counter>(context, listen: false).decrement();
          //   },
          //   tooltip: 'Decrement',
          //   child: const Icon(Icons.remove),
          // ),
          // const SizedBox(width: 10),
          // FloatingActionButton(
          //   onPressed: () {
          //     /* accesses the Counter model without listening to changes.
          //     This is useful for functions that change the state,
          //     like the onPressed handlers for the buttons. */
          //     Provider.of<Counter>(context, listen: false).increment();
          //   },
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ),
        ],
      ),
    );
  }
}
