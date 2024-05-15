import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodallergendetector/home_screen.dart';
import 'package:foodallergendetector/result.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> barcodes = [];
  List<String> names = [];
  List<String> img_urls = [];
  bool isLoading = true;
  String userId = '';
  int i = 0;

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      DatabaseReference productRef =
          FirebaseDatabase.instance.ref('History/$userId/');

      try {
        productRef.onValue.listen((DatabaseEvent event) {
          DataSnapshot dataSnapshot = event.snapshot;

          if (dataSnapshot.value != null && dataSnapshot.value is Map) {
            Map<dynamic, dynamic> products =
                dataSnapshot.value as Map<dynamic, dynamic>;
            barcodes.clear(); // Clear existing data before updating
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
          "History",
          style: TextStyle(
            fontWeight: FontWeight.w700,
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : barcodes.isEmpty && !isLoading
              ? Center(
                  child: Text(
                    "No History found",
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: barcodes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultPage(barcode: barcodes[index])),
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
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0),
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
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          names[index],
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '${barcodes[index]}',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              80,
                                              80,
                                              80,
                                            ),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: IconButton(
                                    icon: Icon(Icons.delete_rounded),
                                    onPressed: () {
                                      _showDeleteConfirmationDialog(
                                        barcodes[index],
                                        names[index],
                                        img_urls[index],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    );
                  },
                ),
    );
  }

  Future<void> delete_from_db(String barcode) async {
    DatabaseReference delProdRef =
        FirebaseDatabase.instance.ref().child('History/$userId');

    try {
      await delProdRef.child(barcode).remove();
      barcodes.remove(barcode);
      names.removeAt(barcodes.indexOf(barcode));
      img_urls.removeAt(barcodes.indexOf(barcode));
      setState(() {});
      print('Data deleted successfully from del_prod.');
    } catch (error) {
      print('Error deleting data from del_prod: ${error.toString()}');
      _showErrorDialog(context); // Display error dialog
    }
  }

  void _showDeleteConfirmationDialog(String barcode, String name, String img) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Product Data',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          content: Text(
            'Are you sure you want to delete this product from history?',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              onPressed: () async {
                await delete_from_db(barcode);
                Navigator.of(context).pop();
                if (barcodes.isEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
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
