import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class EditAllergiesPage extends StatefulWidget {
  @override
  _EditAllergiesPageState createState() => _EditAllergiesPageState();
}

class _EditAllergiesPageState extends State<EditAllergiesPage> {
  List<String> allergies = [];
  List<String> filteredAllergies = [];
  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadAllergies();
  }

  Future<void> saveAllergies(List<String> allergies) async {
    DatabaseReference allergiesRef =
        FirebaseDatabase.instance.ref().child('Allergies/');

    try {
      await allergiesRef.set(allergies);
      allergies = [];
      loadAllergies();
      _showSuccessDialog(context);
      print('Allergies saved successfully.');
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
          allergies = data.map((item) => item.toString()).toList();
          filteredAllergies = List.from(allergies);
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
        filteredAllergies = List.from(allergies);
      } else {
        filteredAllergies = allergies
            .where((allergy) =>
                allergy.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              addAllergies();
            },
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            const SizedBox(
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
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : filteredAllergies.isEmpty && !isLoading
                      ? Center(
                          child: Text(
                            "No allergies found",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredAllergies.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    filteredAllergies[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () =>
                                        _showDeleteConfirmationDialog(
                                            context, index),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Allergy',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          content: Text(
            'Are you sure you want to delete ${filteredAllergies[index]}?',
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
                Navigator.of(context).pop();
                final dataToDelete = filteredAllergies[index];

                await saveAllergies(allergies
                    .where((allergy) => allergy != dataToDelete)
                    .toList());
                setState(() {});
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void addAllergies() {
    final _allergyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Allergy',
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
          content: TextField(
            controller: _allergyController,
            decoration: InputDecoration(
              labelText: 'Allergen Name',
              labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            cursorColor: Color.fromARGB(255, 0, 0, 0),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final allergy = _allergyController.text.trim();
                if (allergy.isNotEmpty) {
                  allergies.add(allergy);
                  saveAllergies(allergies);
                  _allergyController.clear();
                  Navigator.pop(context);
                } else {
                  print('Please enter an allergy name.');
                }
              },
              child: Text('Add'),
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
          title:
              Text('Allergies Updated', style: TextStyle(color: Colors.white)),
          content: Text('Allergies have been successfully updated.',
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

  void _showErrorDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error Saving Allergies',
              style: TextStyle(color: Colors.white)),
          content: Text(
              'An error occurred while saving your allergies. Please try again later.',
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
