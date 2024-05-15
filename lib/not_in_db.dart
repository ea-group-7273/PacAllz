import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodallergendetector/add_product.dart';

class NotInDbPage extends StatefulWidget {
  @override
  _NotInDbPageState createState() => _NotInDbPageState();
}

class _NotInDbPageState extends State<NotInDbPage> {
  List<String> add_prod_List = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
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

  void _confirmdeleteDialog(BuildContext context, String product) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete Data',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          content: Text(
            'Are You Sure You Want To Delete The Data for $product?',
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            TextButton(
              onPressed: () async {
                await delete_from_db(product);
                setState(() {
                  add_prod_List.remove(product);
                });
                if (add_prod_List.isEmpty) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductScreen(result: 'null'),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Yes',
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3a57e8),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Products To Be Added',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLoading
                ? Center(child: CircularProgressIndicator())
                : add_prod_List.isEmpty
                    ? Center(
                        child: Text(
                          "No Products To Add",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: add_prod_List.length,
                          itemBuilder: (context, index) {
                            final String product = add_prod_List[index];
                            if (product == '-1') {
                              return SizedBox.shrink();
                            } else {
                              return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        product,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddProductScreen(
                                                result: product,
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.add),
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          _confirmdeleteDialog(
                                              context, product);
                                        },
                                        icon:
                                            Icon(Icons.delete_outline_outlined),
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
