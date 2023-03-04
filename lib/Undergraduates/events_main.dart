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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events List"),
      ),

      body: Center(child: Column(children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Today',
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),

        Container(
          margin: EdgeInsets.all(25),
          height: 150,
          width: double.infinity,
          color: Colors.blue[200],
          child: GestureDetector (
            onTap: viewEvents,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        children: [
                          TextSpan(text: 'Padura 2023 \n\n',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Date: 05/03/2023 \nTime - 07.00 PM \nVenue - Science Building Premises',
                              style: TextStyle(fontSize: 15))
                        ]
                    )
                )
            ),
          )
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Tomorrow',
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),

        Container(
          margin: EdgeInsets.all(25),
          height: 150,
          width: double.infinity,
          color: Colors.blue[200],

          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: [
                        TextSpan(text: 'Thummulla 2023 \n\n',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Date - 06/03/2023 \nTime - 06.00 PM \nVenue - Thisa Wewa',
                            style: TextStyle(fontSize: 15))
                      ]
                  )
              )
          ),
        ),

      ],
      )),
    );
  }
}
