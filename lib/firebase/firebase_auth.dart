import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/firebase/auth.dart';
import 'package:flutter_exercise_app/exercise_app.dart';
import 'package:flutter_exercise_app/firebase/login_page.dart';

class FirebaseAuth extends StatefulWidget {
  const FirebaseAuth({super.key});

  @override
  State<FirebaseAuth> createState() => _FirebaseAuthState();
}

class _FirebaseAuthState extends State<FirebaseAuth> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const ExerciseApp();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
