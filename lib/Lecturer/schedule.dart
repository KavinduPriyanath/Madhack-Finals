import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  
  final CollectionReference scheduleItems = FirebaseFirestore.instance.collection('lecture');

  final user = FirebaseAuth.instance.currentUser!;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Schedule"),
      ),
      body: StreamBuilder(
        stream: scheduleItems.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {

            final studentDocs = streamSnapshot.data?.docs;
            var studentData;

            if (studentDocs != null){
              int length = studentDocs.length;

              for(int i=0; i < length; i++) {
                studentData = studentDocs?[i].data() as Map<String, dynamic>;
                if (studentData["lecturerEmail"] == user.email!) {
                    return ListView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                          return Card(
                            color: Colors.lightBlue[200],
                            margin: const EdgeInsets.all(10.0),
                            child: ListTile(
                              title: Text("Subject: " + documentSnapshot['subject code'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                              subtitle: Text("Lecture: " + documentSnapshot['lecture topic'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),),
                              trailing: Text("Venue: " + documentSnapshot['venue']),
                            ),
                          );
                        });

                  //print(studentData['role']);
                }
              }
            }



          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
