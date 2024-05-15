import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodallergendetector/result.dart';

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  List<String> barcodes = [];
  List<String> names = [];
  List<String> img_urls = [];
  bool isLoading = true;
  String userId = '';
  int i = 0;
  bool isSaved = true;

  @override
  void initState() {
    super.initState();
    loadSaved();
  }

  Future<void> loadSaved() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      DatabaseReference productRef =
          FirebaseDatabase.instance.ref('Saved/$userId/');

      try {
        productRef.onValue.listen((DatabaseEvent event) {
          DataSnapshot dataSnapshot = event.snapshot;

          if (dataSnapshot.value != null && dataSnapshot.value is Map) {
            Map<dynamic, dynamic> products =
                dataSnapshot.value as Map<dynamic, dynamic>;
            barcodes.clear();
            names.clear();
            img_urls.clear();
            products.forEach((key, value) {
              barcodes.add(key);
              names.add(value['name']);
              img_urls.add(value['imgurl']);
            });
            setState(() {
              isLoading = false;
            });
          } else {
            print('No Saved Data Found.');
            setState(() {
              isLoading = false;
            });
          }
        });
      } catch (error) {
        print('Error loading history: $error');
        _showErrorDialog(context);
      }
    } else {
      print('User is not authenticated');
    }
  }

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
                      "Saved Products",
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
                      Icons.favorite_border_rounded,
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
                alignment: Alignment.topLeft,
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
                        isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : barcodes.isEmpty && !isLoading
                                ? Center(
                                    child: Text(
                                    "No Saved found",
                                    style: TextStyle(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                  ))
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.all(8),
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: img_urls.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultPage(
                                                        barcode:
                                                            barcodes[index])),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Card(
                                              margin: EdgeInsets.all(0),
                                              color: Color(0xffffffff),
                                              shadowColor: Color(0xff000000),
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                    ),
                                                    child: Image.network(
                                                      img_urls[index],
                                                      width: 90,
                                                      height: 90,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            names[index],
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16,
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            '${barcodes[index]}',
                                                            style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  80, 80, 80),
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                      );
                                    },
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

  void _showErrorDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error Updating History',
              style: TextStyle(color: Colors.white)),
          content: Text(
              'An error occurred while updating your history. Please try again later.',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
