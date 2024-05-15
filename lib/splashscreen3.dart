import 'package:flutter/material.dart';
import 'package:foodallergendetector/not_found.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splashscreen3 extends StatefulWidget {
  final String res;

  const Splashscreen3({Key? key, required this.res}) : super(key: key);
  @override
  State<Splashscreen3> createState() => _Splashscreen3State();
}

class _Splashscreen3State extends State<Splashscreen3> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> saveProduct(String productAdd) async {
    if (productAdd == "-1") {
      return;
    }

    DatabaseReference notInDBRef =
        FirebaseDatabase.instance.ref().child('Not_In_DB');

    try {
      await notInDBRef.child(productAdd).set('');
      print('Product saved successfully to Not_In_DB.');
    } catch (error) {
      print('Error saving product to Not_In_DB: ${error.toString()}');
    }
  }

  void navigate() {
    Future.delayed(Duration(seconds: 3), () {
      saveProduct(widget.res);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PageNotFound(
            result: widget.res,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Center(
          child: LoadingAnimationWidget.stretchedDots(
            color: Color(0xff3a57e8),
            size: 55,
          ),
        ),
      ),
    );
  }
}
