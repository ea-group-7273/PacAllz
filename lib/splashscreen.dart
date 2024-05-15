import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodallergendetector/signin_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const backgroundColor = Color(0xFF3a57e8);

  Future<void> _checkSignInStatus(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/signin');
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkSignInStatus(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment(0.0, -0.2),
              child: Image(
                image: AssetImage("assets/logo.png"),
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.1),
              child: Text(
                "PacAllz",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.9),
              child: Text(
                "EA Group",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Allergen Detector',
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/signin': (context) => SignInScreen(),
      },
    );
  }
}

void main() {
  runApp(MyApp());
}
