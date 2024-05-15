import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ResultPage extends StatefulWidget {
  final String barcode;

  ResultPage({required this.barcode});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? prodName;
  String? upprodName;
  List<Ingredient>? tempIngredients;
  String? prodIngredients = '';
  String? upprodIngredients;
  List<String> barcodes = [];
  List<String> UserAllergies = [];
  List<String>? CheckedAllergies = [];
  List<String>? Allergens = [];
  List<String>? FinalAllergens = [];
  List<String>? Addictives = [];
  List<String> matchedElements = [];
  List<String>? Final = [];
  String Temp = '';
  String userId = '';
  String remark = '';
  String? imageUrl;
  bool isLoading = true;
  bool isSaved = false;

  get bar => widget.barcode;

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> loadSaved() async {
    DatabaseReference productRef =
        FirebaseDatabase.instance.ref('Saved/$userId/');

    try {
      productRef.onValue.listen((DatabaseEvent event) {
        DataSnapshot dataSnapshot = event.snapshot;

        if (dataSnapshot.value != null && dataSnapshot.value is Map) {
          Map<dynamic, dynamic> products =
              dataSnapshot.value as Map<dynamic, dynamic>;
          barcodes.clear();
          products.forEach((key, value) {
            barcodes.add(key);
          });
          setState(() {
            isLoading = false;
          });
          findSaved(widget.barcode);
        } else {
          print('No Saved Data Found.');
          setState(() {
            isLoading = false;
          });
        }
      });
    } catch (error) {
      print('Error loading saved: $error');
    }
  }

  void findSaved(String barcode) {
    setState(() {
      isSaved = barcodes.contains(barcode);
    });
  }

  Future<void> loaduserAllergies() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        userId = user.uid;
        DatabaseReference res_userRef =
            FirebaseDatabase.instance.ref().child('Users_Info/$userId/');

        res_userRef.onValue.listen((event) {
          DataSnapshot snapshot = event.snapshot;
          var data = snapshot.value;
          loadSaved();
          if (data != null && data is List<Object?>) {
            setState(() {
              UserAllergies =
                  data.map<String>((item) => item.toString()).toList();
            });
            print(UserAllergies);
            compareAllergens();
            UserAllergies = [];
          } else {
            print('No allergies found for this user in the database.');
          }
        });
      } else {
        print('User is not logged in.');
      }
    } catch (error) {
      print('Error loading user allergies: $error');
    }
  }

  void compareAllergens() {
    if (Allergens == null) {
      print("Allergens list is null. Cannot compare.");
      return;
    }

    List<String>? list2Lower =
        UserAllergies.map((e) => e.toLowerCase()).toList();
    Allergens!.forEach((element) {
      String elementLower = element.toLowerCase();
      if (list2Lower.contains(elementLower)) {
        matchedElements.add(element);
      }
    });
    if (matchedElements.isNotEmpty) {
      print("Matched allergens: $matchedElements");
      remark =
          'This product may not be suitable for you as it contains allergens that could affect your health.';
      Final = Capitalize(matchedElements);
      print("Final: $Final");
    } else {
      remark =
          'This product can be suitable for you as it does not contain any allergens that could affect your health. \n\nMake sure the allergies you uploaded is up to date.';
      print("No allergens found in user allergies.");
    }
  }

  List<String> Capitalize(List<String>? list) {
    return list!.map((string) {
      if (string.isNotEmpty) {
        return string.substring(0, 1).toUpperCase() + string.substring(1);
      } else {
        return string;
      }
    }).toList();
  }

  Future<void> getProduct() async {
    OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'PacAllz');

    OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.ENGLISH
    ];
    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.INDIA;
    ProductQueryConfiguration config = ProductQueryConfiguration(
      widget.barcode,
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
      upprodName = prodName != null ? formatText(prodName!) : '';
      prodIngredients = formatIngredients(product.product?.ingredients);
      Addictives = product.product?.additives?.names;
      upprodIngredients = formatText(prodIngredients!);
      Allergens = product.product?.allergens?.names;
      print(Allergens);
      imageUrl = product.product?.imageFrontUrl;
      isLoading = false;
    });
    loaduserAllergies();
  }

  String? formatIngredients(List<Ingredient>? ingredients) {
    if (ingredients == null || ingredients.isEmpty) return 'Loading...';
    return ingredients.map((ingredient) => ingredient.text).join(", ");
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
    DatabaseReference save =
        FirebaseDatabase.instance.ref().child('$Location/$userId/');

    try {
      await save.child(productAdd).set({
        'name': upprodName,
        'imgurl': imageUrl,
      });
      print('Product saved successfully.');
    } catch (error) {
      print('Error saving product: ${error.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 155, 187, 255),
      appBar: AppBar(
        elevation: 8,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfb3f3fe8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Product Info",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
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
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(250, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: Icon(
                                isSaved
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isSaved
                                    ? Colors.red
                                    : Color.fromARGB(255, 0, 0, 0),
                              ),
                              onPressed: () {
                                if (isSaved == false) {
                                  saveProd('Saved', bar);
                                } else {
                                  isSaved = false;
                                  delete_from_db(bar);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            imageUrl ?? '',
                            width: 150,
                            height: 150,
                            key: UniqueKey(),
                          ),
                        ),
                      ),
                    ),
                    child: Image.network(
                      imageUrl!,
                      width: 150,
                      height: 150,
                      key: UniqueKey(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
                    color: Color(0xffffffff),
                    shadowColor: Color(0xffd5d2d2),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Barcode",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          SizedBox(height: 8),
                          Divider(
                            color: Color(0xff808080),
                            thickness: 0.3,
                          ),
                          ListTile(
                            title: Text(
                              "$bar",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
                    color: Color(0xffffffff),
                    shadowColor: Color(0xffd5d2d2),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment(0.1, 0.0),
                            child: Text(
                              "Product Name",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff808080),
                            height: 16,
                            thickness: 0.3,
                            indent: 0,
                            endIndent: 0,
                          ),
                          ListTile(
                            title: Text(
                              "$upprodName",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
                    color: Color(0xffffffff),
                    shadowColor: Color(0xffd5d2d2),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment(0.1, 0.0),
                            child: Text(
                              "Product Ingredients",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff808080),
                            height: 16,
                            thickness: 0.3,
                            indent: 0,
                            endIndent: 0,
                          ),
                          ListTile(
                            title: Text(
                              "$upprodIngredients",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
                    color: Color(0xffffffff),
                    shadowColor: Color(0xffd5d2d2),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment(0.1, 0.0),
                            child: Text(
                              "Product Addictives",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff808080),
                            height: 16,
                            thickness: 0.3,
                            indent: 0,
                            endIndent: 0,
                          ),
                          ListTile(
                            title: Text(
                              "${Addictives!.join(', ')}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
                    color: Color(0xffffffff),
                    shadowColor: Color(0xffd5d2d2),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment(0.1, 0.0),
                            child: Text(
                              "Product Allergens",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff808080),
                            height: 16,
                            thickness: 0.3,
                            indent: 0,
                            endIndent: 0,
                          ),
                          ListTile(
                            title: Text(
                              "${Final!.join(', ')}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
                    color: Color(0xffffffff),
                    shadowColor: Color(0xffd5d2d2),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment(0.1, 0.0),
                            child: Text(
                              "Remarks",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Divider(
                            color: Color(0xff808080),
                            height: 16,
                            thickness: 0.3,
                            indent: 0,
                            endIndent: 0,
                          ),
                          ListTile(
                            title: Text(
                              "$remark",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: 16,
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> delete_from_db(String barcode) async {
    DatabaseReference delProdRef =
        FirebaseDatabase.instance.ref().child('Saved/$userId');

    try {
      await delProdRef.child(barcode).remove();
      barcodes.remove(barcode);
      setState(() {});
      print('Data deleted successfully from del_prod.');
    } catch (error) {
      print('Error deleting data from del_prod: ${error.toString()}');
    }
  }
}
