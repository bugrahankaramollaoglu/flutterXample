import 'package:flutter/material.dart';

class CommunicationWidgets extends StatefulWidget {
  const CommunicationWidgets({super.key});

  @override
  State<CommunicationWidgets> createState() => _CommunicationWidgetsState();
}

class _CommunicationWidgetsState extends State<CommunicationWidgets> {
  String? selectedOption = 'aaa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // showToast void oldugundan böyle kullanmalısın, direkt kullanamazsın
                showSnackbar(context, 'Snackbar Message');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 7,
              ),
              child: const Text('Snackbar Message'),
            ),
            const SizedBox(height: 50),
            const LinearProgressIndicator(
              semanticsLabel: 'aaa',
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 50),
            const CircularProgressIndicator(
              semanticsLabel: 'aaa',
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String s) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(s),

      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.yellow,
        onPressed: () {
          // do
        },
      ),
      // behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
