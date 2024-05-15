import 'package:flutter/material.dart';
import 'package:foodallergendetector/about_us.dart';
import 'package:foodallergendetector/feedback.dart';
import 'package:foodallergendetector/privacy_policy.dart';
import 'package:foodallergendetector/t&c.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Container(
        color: const Color.fromARGB(255, 11, 11, 11),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Feedback',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FeedbackPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                          position: offsetAnimation, child: child);
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Terms And Conditions',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsAndConditionsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'About Us',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
