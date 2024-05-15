import 'package:flutter/material.dart';
import 'package:foodallergendetector/signin_screen.dart';

class SignUpVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Email Verification",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xffffffff),
          size: 24,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xff3a57e8),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
              ),
              child: Image(
                image: NetworkImage(
                    "https://cdn1.iconfinder.com/data/icons/basic-ui-icon-rounded-colored/512/icon-41-256.png"),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 200, 16, 0),
              padding: EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                        "A verification link has been sent to your email address. Please click on the link to complete the verification process. Then signin to your newly created account.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      padding: EdgeInsets.all(0),
                      width: 50,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xff3a57e8),
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          );
                        },
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xffffffff),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
