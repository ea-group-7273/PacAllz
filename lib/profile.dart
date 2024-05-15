import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodallergendetector/allergies.dart';
import 'package:foodallergendetector/personal_info.dart';
import 'signin_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedecec),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Color(0xff3a57e8),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Profile",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Icon(
                      Icons.person_2_outlined,
                      color: Color(0xffffffff),
                      size: 24,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: _buildWelcomeText(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(16, 120, 16, 16),
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.46,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 16,
                          width: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllergiesPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0x343a57e8),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.space_dashboard_outlined,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Your Allergies",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xff808080),
                          height: 16,
                          thickness: 0.3,
                          indent: 0,
                          endIndent: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonalInfoPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0x343a57e8),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.photo_camera_front_sharp,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Personal Information",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Color(0xff808080),
                          height: 16,
                          thickness: 0.3,
                          indent: 0,
                          endIndent: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showLogoutConfirmationDialog();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0x343a57e8),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.logout_outlined,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Logout",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      if (user.providerData.isNotEmpty &&
          user.providerData[0].providerId == 'google.com') {
        // If the user signed in with Google
        return Text(
          'Hai, ${user.displayName}',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        );
      } else {
        // If the user signed in with email
        return Text(
          'Hai, ${user.displayName}',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        );
      }
    } else {
      return Text(
        'Hai',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
  }

  void _logout(BuildContext context) {
    FirebaseAuth.instance.signOut().then((value) {
      print("Signed Out");
      Navigator.popUntil(context, ModalRoute.withName('/'));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Logout',
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are you sure you want to log out?',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Logout',
              ),
              onPressed: () {
                _logout(context);
              },
            ),
          ],
        );
      },
    );
  }
}
