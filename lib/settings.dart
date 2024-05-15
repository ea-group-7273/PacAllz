import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodallergendetector/about_us.dart';
import 'package:foodallergendetector/app_version.dart';
import 'package:foodallergendetector/chg_pass.dart';
import 'package:foodallergendetector/contact_us.dart';
import 'package:foodallergendetector/feedback.dart';
import 'package:foodallergendetector/privacy_policy.dart';
import 'package:foodallergendetector/signin_screen.dart';
import 'package:foodallergendetector/t&c.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                      "Settings",
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
                      Icons.settings,
                      color: Color(0xffffffff),
                      size: 24,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
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
              height: MediaQuery.of(context).size.height,
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
                                  builder: (context) => ChangePasswordPage()),
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
                                  Icons.admin_panel_settings,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Change Password",
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
                                  builder: (context) => FeedbackPage()),
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
                                  Icons.chat,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Feedback",
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
                                  builder: (context) =>
                                      TermsAndConditionsPage()),
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
                                  Icons.article,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Terms of Service",
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
                                  builder: (context) => PrivacyPolicyPage()),
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
                                  Icons.privacy_tip_outlined,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Privacy Policy",
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
                        // Divider(
                        //   color: Color(0xff808080),
                        //   height: 16,
                        //   thickness: 0.3,
                        //   indent: 0,
                        //   endIndent: 0,
                        // ),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       Container(
                        //         alignment: Alignment.center,
                        //         margin: EdgeInsets.all(0),
                        //         padding: EdgeInsets.all(12),
                        //         decoration: BoxDecoration(
                        //           color: Color(0x343a57e8),
                        //           shape: BoxShape.circle,
                        //         ),
                        //         child: Icon(
                        //           Icons.help_outline,
                        //           color: Color(0xff3a57e8),
                        //           size: 24,
                        //         ),
                        //       ),
                        //       Expanded(
                        //         flex: 1,
                        //         child: Padding(
                        //           padding: EdgeInsets.all(16),
                        //           child: Text(
                        //             "Help",
                        //             textAlign: TextAlign.start,
                        //             overflow: TextOverflow.clip,
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.w700,
                        //               fontStyle: FontStyle.normal,
                        //               fontSize: 16,
                        //               color: Color(0xff000000),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
                                  builder: (context) => contactus()),
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
                                  Icons.connect_without_contact_rounded,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Contact Us",
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
                                  builder: (context) => AboutUsPage()),
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
                                  Icons.people_outline_outlined,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "About Us",
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
                                  builder: (context) => AppVersionPage()),
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
                                  Icons.sort,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "App Version",
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
                                  Icons.logout,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Log out",
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
                        SizedBox(
                          height: 16,
                          width: 16,
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
}
