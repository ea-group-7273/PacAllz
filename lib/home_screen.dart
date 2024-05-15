import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:foodallergendetector/add_product.dart';
import 'package:foodallergendetector/admin_feedback.dart';
import 'package:foodallergendetector/edit_allergies.dart';
import 'package:foodallergendetector/history.dart';
import 'package:foodallergendetector/splashscreen2.dart';
import 'package:foodallergendetector/splashscreen3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _scanBarcodeResult = '';

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "PacAllz",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 40,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Scan, Eat, Safe",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
              height: MediaQuery.of(context).size.height * 0.51,
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
                        Text(
                          'Click On The "Scan" Button Below And Scan The Barcode Present On Any Packaged Food.',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
                          onTap: () => _scanBarcode(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  Icons.barcode_reader,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Scan",
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
                                  builder: (context) => HistoryPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  Icons.history_rounded,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "History",
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
                                      AddProductScreen(result: 'null')),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  Icons.add_box_outlined,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Add Product",
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
                                  builder: (context) => AdminFeedback()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  Icons.view_list_outlined,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "View Feedback",
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
                                  builder: (context) => EditAllergiesPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  Icons.edit_note,
                                  color: Color(0xff3a57e8),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Edit Allergies",
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
    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      if (user.providerData.isNotEmpty &&
          user.providerData[0].providerId == 'google.com') {
        return Text(
          'Welcome, ${user.displayName}',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        );
      } else {
        return Text(
          'Welcome, ${user.displayName}',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        );
      }
    } else {
      return Text(
        'Welcome',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
  }

  Future<void> searchAndReadData(String keyValue) async {
    String? prodName;
    bool found = false;
    ProductQueryConfiguration config = ProductQueryConfiguration(
      '$keyValue',
      fields: [
        ProductField.NAME,
      ],
      version: ProductQueryVersion.v3,
    );
    ProductResultV3 product = await OpenFoodAPIClient.getProductV3(config);
    setState(() {
      prodName = product.product?.productName;
    });
    print(prodName);
    if (prodName != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Splashscreen2(
            res: _scanBarcodeResult,
          ),
        ),
      );
      found = true;
    }
    if (!found) {
      print('Matching data not found');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Splashscreen3(
            res: _scanBarcodeResult,
          ),
        ),
      );
    }
  }

  Future<void> _scanBarcode(BuildContext context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version";
    }

    if (barcodeScanRes != '-1') {
      setState(() {
        _scanBarcodeResult = barcodeScanRes;
      });
      OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'PacAllz');

      OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
        OpenFoodFactsLanguage.ENGLISH
      ];

      OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.INDIA;
      searchAndReadData(_scanBarcodeResult);
    } else if (barcodeScanRes != '-1') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Barcode scan result is empty."),
          duration: Duration(seconds: 2),
        ),
      );
    } else {}
  }
}
