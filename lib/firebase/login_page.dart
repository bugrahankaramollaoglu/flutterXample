import 'package:flutter_exercise_app/firebase/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise_app/exercise_app.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool _obscureText = true; // State variable to track password visibility

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text,
      );

      // If login is successful, navigate to HomePage and remove the login page from the stack
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ExerciseApp()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      _showToast('Kayit basarilir!.');
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      _showToast('Kayit islemi yapilamadi..');
    }
  }

  Widget _entryFieldEmail(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.75),
              spreadRadius: 0.3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: title,
            labelStyle: const TextStyle(color: Color.fromARGB(255, 90, 85, 85)),
            suffixIcon: const Icon(Icons.email_rounded,
                color: Color.fromARGB(255, 90, 85, 85)),
          ),
        ),
      ),
    );
  }

  Widget _entryFieldPassword(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.75),
              spreadRadius: 0.3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: _obscureText, // Use the state variable here
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: title,
            labelStyle: const TextStyle(color: Color.fromARGB(255, 90, 85, 85)),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; // Toggle the visibility
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color.fromARGB(255, 90, 85, 85),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
      child: ElevatedButton(
        onPressed: signInWithEmailAndPassword,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
        ),
        child: const Text(
          'Giris',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextButton(
        onPressed: createUserWithEmailAndPassword,
        child: const Text(
          'Hesabiniz yok mu?\nKaydolun',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _appImage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: Image.asset('assets/app_logo.png'),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Divider(
          thickness: 2,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _appName() {
    return Container(
      child: const Text(
        'Flutter Exercises',
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
          fontFamily: 'Madimi',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepPurpleAccent,
                Colors.white,
              ],
            ),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _appName(),
              const SizedBox(height: 50),
              _entryFieldEmail('e-posta', _controllerEmail),
              _entryFieldPassword('sifre', _controllerPassword),
              _submitButton(),
              _loginOrRegisterButton(),
              _divider(),
            ],
          ),
        ),
      ),
    );
  }
}
