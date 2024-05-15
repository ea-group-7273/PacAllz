import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3a57e8),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xffffffff),
                        size: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Feedback",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 25,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
              padding: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'We value your feedback!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 13),
                      Text(
                        'Please share your thoughts with us:',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 13),
                      TextFormField(
                        controller: _feedbackController,
                        maxLines: 5,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Feedback',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.newline,
                      ),
                      SizedBox(height: 13),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            String feedback = _feedbackController.text.trim();
                            if (feedback.isNotEmpty) {
                              // Initialize Firebase (make sure to call this only once)
                              await Firebase.initializeApp();

                              // Get current user details
                              User? user = FirebaseAuth.instance.currentUser;
                              String? userId = user?.uid;
                              String? username = user?.displayName;
                              String? email = user?.email;

                              if (userId != null &&
                                  username != null &&
                                  email != null) {
                                // Send feedback to Firebase Firestore
                                await FirebaseFirestore.instance
                                    .collection('feedback')
                                    .add({
                                  'feedback': feedback,
                                  'timestamp': FieldValue.serverTimestamp(),
                                  'userId': userId,
                                  'username': username,
                                  'email': email,
                                });

                                // Display success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Feedback successfully submitted'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );

                                // Return to the Settings screen
                                Navigator.pop(context);
                              }
                            } else {
                              // Display error dialog for empty feedback
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Empty Feedback',
                                    ),
                                    content: Text(
                                      'Please enter your feedback before submitting.',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    backgroundColor: Colors.white,
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'OK',
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 255, 255),
                            elevation: 5,
                          ),
                          child: Text(
                            'Submit Feedback',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FeedbackPage(),
  ));
}
