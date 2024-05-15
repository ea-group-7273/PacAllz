import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodallergendetector/navigator.dart';
import 'package:foodallergendetector/profile.dart';
import 'splashscreen.dart';
import 'signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Allergen Detector',
      home: AuthWrapper(),
      routes: {
        '/home': (context) => NavigatorPage(),
        '/signin': (context) => SignInScreen(),
        '/profile': (context) => ProfilePage()
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;

          if (user == null) {
            return SplashScreen();
          } else {
            return SplashScreen();
          }
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
