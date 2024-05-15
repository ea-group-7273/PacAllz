import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "Contact Us",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    color: Color(0xff3a57e8),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(140.0)),
                  border: Border.all(color: Color(0xff3a57e8), width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment(0.0, -0.2),
                        child: Image(
                          image: AssetImage("assets/logo2.png"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "This app was developed and is maintained by \nEA GROUP. If you have any questions or \ninformation you'd like to share, please don't \nhesitate to contact us using the provided \nchannels below.\n\n\n",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.call,
                            color: Color(0xff3a57e8),
                            size: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "+91 9846226001",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.mail,
                              color: Color(0xff3a57e8),
                              size: 24,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "eagroup7273@gmail.com",
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: MaterialButton(
                          onPressed: () {
                            _launchPhoneApp();
                          },
                          color: Color(0xff3a57e8),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Open Dialpad",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          textColor: Color(0xffffffff),
                          height: 45,
                          minWidth: 140,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: MaterialButton(
                          onPressed: () {
                            _launchGmail();
                          },
                          color: Color(0xff3a57e8),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Open Gmail",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          textColor: Color(0xffffffff),
                          height: 45,
                          minWidth: 140,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchPhoneApp() async {
    const url = 'tel:+919846226001';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchGmail() async {
    const url = 'mailto:eagroup7273@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
