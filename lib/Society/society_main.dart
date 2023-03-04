import 'package:flutter/material.dart';
import 'package:login_flutter/Society/profile.dart';

import 'add_events.dart';

class SocietyMain extends StatefulWidget {
  const SocietyMain({Key? key}) : super(key: key);

  @override
  State<SocietyMain> createState() => _SocietyMainState();
}

class _SocietyMainState extends State<SocietyMain> {

  int _currentPageIndex = 0; // track the current page index

  // define a list of pages to navigate to
  final List<Widget> _pages = [    SocietyMain(),    Profile(),  ];

  // update the current page index
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
      if (_currentPageIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SocietyMain()),
        );
      }
      else if (_currentPageIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      }
    });
  }

  void addEvents() {
    Navigator.pushNamed(context, "/createevents");
  }

  void viewEvents() {
    Navigator.pushNamed(context, "/viewevents");
  }

  List<Event> _events = [
    Event('Mar 10', '8:00 PM', 'Event 1 description'),
    Event('Mar 12', '10:00 AM', 'Event 2 description'),
    Event('Mar 15', '2:30 PM', 'Event 3 description'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Society Page"),
      ),

      //Dashboard
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: addEvents,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
                child: Card(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Add Events'
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_grocery_store,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Go to Store'
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(
              color: Colors.grey,
              height: 50,
              thickness: 1,
            ),

            //Event Topics
            Column(
              children: [
                Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 10.0),
              ],
            ),

            //List of events
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (BuildContext context, int index) {
                  Event event = _events[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: viewEvents,
                      child: Card(
                        color: Colors.lightBlue[100],
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.date,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                event.time,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(event.description),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _updatePageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Event {
  final String date;
  final String time;
  final String description;

  Event(this.date, this.time, this.description);
}
