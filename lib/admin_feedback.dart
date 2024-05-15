import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodallergendetector/feedback_details.dart';
import 'package:intl/intl.dart';

class AdminFeedback extends StatefulWidget {
  @override
  _AdminFeedbackState createState() => _AdminFeedbackState();
}

class _AdminFeedbackState extends State<AdminFeedback> {
  final _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _feedbackList = [];

  @override
  void initState() {
    super.initState();
    _getFeedback();
  }

  void _getFeedback() async {
    try {
      final QuerySnapshot feedbackCollection =
          await _firestore.collection('feedback').get();

      setState(() {
        _feedbackList = feedbackCollection.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (error) {
      print('Error fetching feedback: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    _feedbackList.sort((a, b) =>
        (b['timestamp'] as Timestamp).compareTo(a['timestamp'] as Timestamp));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedbacks Recieved',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff3a57e8),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 255, 255, 255),
        child: _feedbackList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _feedbackList.length,
                itemBuilder: (context, index) {
                  final feedback = _feedbackList[index];
                  final email = feedback['email'] ?? 'No email';
                  final timestamp = feedback['timestamp'] as Timestamp?;

                  String formattedTimestamp = 'No Timestamp';
                  if (timestamp != null) {
                    final dateTime = timestamp.toDate();
                    formattedTimestamp = DateFormat.yMMMMEEEEd()
                        .add_Hm()
                        .add_jms()
                        .format(dateTime);
                  }

                  return ListTile(
                    title: Text(
                      email,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    subtitle: Text(
                      formattedTimestamp.toString(),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FeedbackDetailsPage(feedback: feedback),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
