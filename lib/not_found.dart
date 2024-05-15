import 'package:flutter/material.dart';
import 'package:foodallergendetector/add_product.dart';
import 'package:lottie/lottie.dart';

class PageNotFound extends StatelessWidget {
  final String result;

  const PageNotFound({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.network(
                  "https://assets10.lottiefiles.com/packages/lf20_mxuufmel.json",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: true,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                  child: Text(
                    "OOPS! No records found",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff3e3e3e),
                    ),
                  ),
                ),
                Text(
                  "There Is No Record Of The Scanned Product. Our Team Will Update This Product's Data As Soon As Possible.",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff848484),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 16),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddProductScreen(result: result)),
                      );
                    },
                    color: Color(0xff3a57e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    child: Text(
                      "Add Product",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xffffffff),
                    height: 45,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 16),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Color(0xff3a57e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    child: Text(
                      "Return To Homepage",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xffffffff),
                    height: 45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
