import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3a57e8),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipOval(
                            child: FutureBuilder(
                              future: getImageURL('edwin.jpg'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Image.network(
                                    snapshot.data.toString(),
                                    width: 150,
                                    height: 150,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Edwin Arun',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Co-Founder\nand\nLead Developer',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        children: [
                          ClipOval(
                            child: FutureBuilder(
                              future: getImageURL('bibin.jpg'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Image.network(
                                    snapshot.data.toString(),
                                    width: 150,
                                    height: 150,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Bibin Roy',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Co-Founder',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipOval(
                            child: FutureBuilder(
                              future: getImageURL('manu.jpg'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Image.network(
                                    snapshot.data.toString(),
                                    width: 150,
                                    height: 150,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Manu J',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Co-Founder',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        children: [
                          ClipOval(
                            child: FutureBuilder(
                              future: getImageURL('amaan.jpg'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return Image.network(
                                    snapshot.data.toString(),
                                    width: 150,
                                    height: 150,
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Muhammed Amaan',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Co-Founder',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getImageURL(String imageName) async {
    final ref =
        FirebaseStorage.instance.ref().child('about_us').child(imageName);
    return await ref.getDownloadURL();
  }
}
