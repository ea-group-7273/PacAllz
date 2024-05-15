import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _userdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Personal Information",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '$email',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _userdata() async {
    User? user = FirebaseAuth.instance.currentUser;
    email = user!.email!;

    if (user.providerData.isNotEmpty &&
        user.providerData[0].providerId == 'google.com') {
      name = user.displayName!;
    } else {
      name = user.displayName!;
    }
  }
}
