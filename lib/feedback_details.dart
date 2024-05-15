import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedbackDetailsPage extends StatelessWidget {
  final Map<String, dynamic> feedback;

  const FeedbackDetailsPage({required this.feedback});

  @override
  Widget build(BuildContext context) {
    final message = feedback['feedback'] ?? 'No message';
    final username = feedback['username'] ?? 'No username';
    final timestamp = feedback['timestamp'] as Timestamp?;
    final uid = feedback['userId'] ?? 'No User ID';

    String formattedTimestamp = 'No Timestamp';
    if (timestamp != null) {
      final dateTime = timestamp.toDate();
      formattedTimestamp =
          DateFormat.yMMMMEEEEd().add_Hm().add_jms().format(dateTime);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback Details',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color(0xff3a57e8),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        '$username',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black54),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feedback Provided:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        '$message',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black54),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        '${feedback['email']}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black54),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User ID:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        '$uid',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black54),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time Stamp:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        '$formattedTimestamp',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
