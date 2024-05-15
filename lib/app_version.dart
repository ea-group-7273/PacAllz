import 'package:flutter/material.dart';

class AppVersionPage extends StatefulWidget {
  @override
  _AppVersionPageState createState() => _AppVersionPageState();
}

class _AppVersionPageState extends State<AppVersionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "App Information",
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
          Align(
            alignment: Alignment(0.0, -0.2),
            child: Image(
              image: AssetImage("assets/logo2.png"),
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'App Version:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '1.0.0',
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
                  'Release Date:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '01 May 2024',
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
}
