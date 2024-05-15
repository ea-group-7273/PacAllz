import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodallergendetector/result.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class Splashscreen2 extends StatefulWidget {
  final String res;

  const Splashscreen2({Key? key, required this.res}) : super(key: key);

  @override
  State<Splashscreen2> createState() => _Splashscreen2State();
}

class _Splashscreen2State extends State<Splashscreen2> {
  String? prodName;
  String? upprodName;
  String? imageUrl;
  String userId = '';

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    ProductQueryConfiguration config = ProductQueryConfiguration(
      widget.res,
      fields: [
        ProductField.IMAGE_FRONT_URL,
        ProductField.NAME,
        ProductField.INGREDIENTS,
        ProductField.ADDITIVES,
        ProductField.ALLERGENS
      ],
      version: ProductQueryVersion.v3,
    );
    ProductResultV3 product = await OpenFoodAPIClient.getProductV3(config);
    setState(() {
      prodName = product.product?.productName;
      upprodName = formatText(prodName!);
      imageUrl = product.product?.imageFrontUrl;
      saveProd('History', widget.res);
    });
  }

  String formatText(String text) {
    text = text.replaceAllMapped(RegExp(r',([^ ])'), (match) {
      return ', ${match.group(1)}';
    });

    List<String> words = text.split(' ');

    for (int i = 0; i < words.length; i++) {
      if ((words[i].startsWith('(') || words[i].startsWith('[')) &&
          words[i].length > 1) {
        words[i] = words[i].substring(0, 2).toUpperCase() +
            words[i].substring(2).toLowerCase();
      } else {
        words[i] = words[i].substring(0, 1).toUpperCase() +
            words[i].substring(1).toLowerCase();
      }
    }

    String formattedText = words.join(' ');
    formattedText = formattedText.replaceAll(' And ', ', ');

    return formattedText;
  }

  Future<void> saveProd(String Location, String productAdd) async {
    var user = FirebaseAuth.instance.currentUser;
    userId = user!.uid;
    DatabaseReference save =
        FirebaseDatabase.instance.ref().child('$Location/$userId/');

    try {
      await save.child(productAdd).set({
        'name': upprodName,
        'imgurl': imageUrl,
      });
      print('Product saved successfully.');
      navigate();
    } catch (error) {
      print('Error saving product: ${error.toString()}');
    }
  }

  void navigate() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            barcode: widget.res,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Center(
          child: LoadingAnimationWidget.stretchedDots(
            color: Color(0xff3a57e8),
            size: 55,
          ),
        ),
      ),
    );
  }
}
