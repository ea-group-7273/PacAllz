import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodallergendetector/navigator.dart';

class AllergiesPage extends StatefulWidget {
  @override
  _AllergiesPageState createState() => _AllergiesPageState();
}

class _AllergiesPageState extends State<AllergiesPage> {
  List<String> allergiesList = [];
  List<bool> selectedItems = [];
  List<String> tempList = [];
  List<String> selectedAllergy = [];
  List<bool> selectedAllergies = [];
  bool isLoading = true;
  List<String> filteredAllergies = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAllergies();
  }

  Future<void> saveAllergies() async {
    selectedAllergy.clear();
    for (int i = 0; i < allergiesList.length; i++) {
      if (selectedItems[i]) {
        selectedAllergy.add(allergiesList[i]);
      }
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('User is not logged in. Please log in to save allergies.');
      return;
    }

    String userId = user.uid;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('Users_Info/$userId/');

    try {
      await userRef.set(selectedAllergy);
      print('Allergies saved successfully.');
      _showSuccessDialog(context);
    } catch (error) {
      print('Error saving allergies: ${error.toString()}');
      _showErrorDialog(context);
    }
  }

  Future<void> loadAllergies() async {
    DatabaseReference allergiesRef =
        FirebaseDatabase.instance.ref('Allergies/');
    allergiesRef.onValue.listen((DatabaseEvent event) {
      final Object? data = event.snapshot.value;

      if (data != null && data is List<Object?>) {
        setState(() {
          allergiesList = data.map((item) => item.toString()).toList();
          filteredAllergies = List.from(allergiesList);
          selectedItems = List.generate(allergiesList.length, (index) => false);
          loaduserAllergies();
          isLoading = false;
        });
      } else {
        print('No allergies found in the database.');
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  void filterAllergies(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredAllergies = List.from(allergiesList);
      } else {
        filteredAllergies = allergiesList
            .where((allergy) =>
                allergy.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> loaduserAllergies() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userId = user.uid;
      print(userId);
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('Users_Info/$userId/');

      userRef.onValue.listen((DatabaseEvent event) {
        final Object? data = event.snapshot.value;
        if (data != null && data is List<Object?>) {
          setState(() {
            tempList = data.map((item) => item.toString()).toList();
            for (int i = 0; i < allergiesList.length; i++) {
              for (int j = 0; j < tempList.length; j++) {
                if (allergiesList[i] == tempList[j]) {
                  selectedItems[i] = true;
                }
              }
            }
          });
          tempList = [];
        } else {
          print('No allergies found for this user in the database.');
        }
      });
    } else {
      print('User is not logged in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Allergies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3a57e8),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _showSaveConfirmationDialog(context),
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Any of these food allergies?',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        textTheme: TextTheme(
                          bodyText1: TextStyle(color: Colors.black),
                          bodyText2: TextStyle(color: Colors.black),
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: filterAllergies,
                        decoration: InputDecoration(
                          hintText: "Search Allergies",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.black87),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : filteredAllergies.isEmpty && !isLoading
                    ? Center(
                        child: Text(
                        "No allergies found",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: filteredAllergies.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedItems[index] = !selectedItems[index];
                                });
                              },
                              child: Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      filteredAllergies[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: selectedItems[index]
                                            ? Color.fromARGB(255, 255, 0, 0)
                                            : Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: selectedItems[index]
                                          ? Color.fromARGB(255, 255, 0, 0)
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  void _showSaveConfirmationDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save Changes',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          content: Text('Are you sure you want to save the changes?',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                Navigator.of(context).pop();
                await saveAllergies();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Allergies Saved',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          content: Text('Your allergies have been successfully saved.',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavigatorPage(initialIndex: 2)),
                );
              },
              child: Text('Ok'),
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
          title: Text('Error Saving Allergies',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          content: Text(
              'An error occurred while saving your allergies. Please try again later.',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
