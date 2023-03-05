import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventsMain extends StatefulWidget {
  const EventsMain({Key? key}) : super(key: key);

  @override
  State<EventsMain> createState() => _EventsMainState();
}

class _EventsMainState extends State<EventsMain> {

  void viewEvents() {
    Navigator.pushNamed(context, "/viewevent");
  }
  // List<Event> _events = [
  //   Event('Mar 10', '8:00 PM', 'Event 1 description'),
  //   Event('Mar 12', '10:00 AM', 'Event 2 description'),
  //   Event('Mar 15', '2:30 PM', 'Event 3 description'),
  // ];

  final CollectionReference upcomingEvents = FirebaseFirestore.instance.collection('event');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events List"),
      ),

      body: StreamBuilder(
        stream: upcomingEvents.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {

            final studentDocs = streamSnapshot.data?.docs;
            var studentData;

            if (studentDocs != null) {
              int length = studentDocs.length;

              for (int i = 0; i < length; i++) {
                studentData = studentDocs?[i].data() as Map<String, dynamic>;
                return Center(child: Column(children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Today',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.all(25),
                      height: 150,
                      width: double.infinity,
                      color: Colors.blue[200],
                      child: GestureDetector(
                        onTap: viewEvents,
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    children: [
                                      TextSpan(text: 'Padura 2023 \n\n',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: 'Date: 05/03/2023 \nTime - 07.00 PM \nVenue - Science Building Premises',
                                          style: TextStyle(fontSize: 15))
                                    ]
                                )
                            )
                        ),
                      )
                  ),


                ],
                ));
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
