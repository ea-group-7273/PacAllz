import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodallergendetector/navigator.dart';
import 'package:foodallergendetector/not_in_db.dart';

class AddProductScreen extends StatefulWidget {
  final String result;

  const AddProductScreen({Key? key, required this.result}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _producturlController = TextEditingController();
  final TextEditingController _productIngredientsController =
      TextEditingController();
  final TextEditingController _allergensController = TextEditingController();
  List<String> add_prod_List = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.result != 'null') {
      _productIdController.text = widget.result;
    }
    load_not_in_db();
  }

  Future<void> load_not_in_db() async {
    try {
      DatabaseReference allergiesRef =
          FirebaseDatabase.instance.ref('Not_In_DB/');
      allergiesRef.onValue.listen((DatabaseEvent event) {
        final Object? data = event.snapshot.value;

        if (data != null && data is Map<Object?, Object?>) {
          setState(() {
            add_prod_List = data.keys.map((key) => key.toString()).toList();
            isLoading = false;
          });
        } else {
          print('Invalid data format or no data found.');
          setState(() {
            isLoading = false;
          });
        }
      });
    } catch (error) {
      print('Error loading data from database: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> delete_from_db(String dataToDelete) async {
    DatabaseReference delProdRef =
        FirebaseDatabase.instance.ref().child('Not_In_DB/');

    try {
      await delProdRef.child(dataToDelete).remove();
      print('Data deleted successfully from del_prod.');
    } catch (error) {
      print('Error deleting data from del_prod: ${error.toString()}');
    }
  }

  Future<void> _addProduct() async {
    String productId = _productIdController.text;
    String productName = _productNameController.text;
    String producturl = _producturlController.text;
    String productIngredients = _productIngredientsController.text;
    String allergens = _allergensController.text;

    if (productId.isEmpty ||
        productName.isEmpty ||
        producturl.isEmpty ||
        productIngredients.isEmpty ||
        allergens.isEmpty) {
      _showErrorDialog(
          context, 'Missing Information', 'Please fill in all fields.');
      return;
    }

    String upproductName = formatText(productName);
    String upproductIngredients = formatText(productIngredients);
    String upallergens = formatText(allergens);

    DatabaseReference productRef =
        FirebaseDatabase.instance.ref().child('Product_Info/$productId');

    try {
      await productRef.set({
        'name': upproductName,
        'ingredients': upproductIngredients,
        'url': producturl,
        'allergens': upallergens,
      });
      print('Product Data saved successfully.');
      delete_from_db(productId);
      _showSuccessDialog(context);
    } on FirebaseException catch (error) {
      print('Error saving product data: ${error.message}');
      _showErrorDialog(context, 'Error Saving Product Data',
          'An error occurred while saving product data. Please try again later.');
    } catch (error) {
      print('Unexpected error: ${error}');
      _showErrorDialog(context, 'Unexpected Error',
          'An unexpected error occurred. Please try again later.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Color(0xff3a57e8),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.library_add_outlined),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotInDbPage(),
                    ),
                  );
                },
              ),
              if (add_prod_List.isNotEmpty)
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      add_prod_List.length.toString(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            bodyText2: TextStyle(color: const Color.fromARGB(255, 11, 11, 11)),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _productIdController,
                  decoration: InputDecoration(
                    labelText: 'Product ID',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _productNameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _producturlController,
                  decoration: InputDecoration(
                    labelText: 'Product URL',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _productIngredientsController,
                  decoration: InputDecoration(
                    labelText: 'Product Ingredients',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                TextField(
                  controller: _allergensController,
                  decoration: InputDecoration(
                    labelText: 'Allergens',
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _addProduct,
                  style: ElevatedButton.styleFrom(primary: Color(0xff3a57e8)),
                  child: Text(
                    "Add Product",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  void main() {
    String originalText = "this is a Test string and another test";
    String formattedText = formatText(originalText);
    print("Original Text: $originalText");
    print("Formatted Text: $formattedText");
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Product Saved',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          content: Text(
            'Product data have been successfully saved.',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _productIdController.clear();
                _productNameController.clear();
                _producturlController.clear();
                _productIngredientsController.clear();
                _allergensController.clear();
                Navigator.pop(context);
              },
              child: Text(
                'Add Again',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavigatorPage(initialIndex: 0)),
                );
              },
              child: Text(
                'Finish',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: Colors.grey[900],
          content: Text(
            message,
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ],
        );
      },
    );
  }
}
