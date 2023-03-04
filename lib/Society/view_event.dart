import 'package:flutter/material.dart';
import 'package:login_flutter/Society/profile.dart';
import 'package:login_flutter/Society/society_main.dart';

class ViewSocietyEvents extends StatefulWidget {
  const ViewSocietyEvents({Key? key}) : super(key: key);

  @override
  State<ViewSocietyEvents> createState() => _ViewSocietyEventsState();
}

class _ViewSocietyEventsState extends State<ViewSocietyEvents> {

  int _currentPageIndex = 0; // track the current page index

  // define a list of pages to navigate to
  final List<Widget> _pages = [
    SocietyMain(),
    Profile(),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WORKSHOP 2'),
      ),

      //body
      body: Padding(

        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 30.0),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Center(
                child: Image(
                 image: AssetImage('assets/society_event-1.jpeg'),
                  height: 200,
                  width: 200,
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Card(
                    color: Colors.blue[200],
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(
                          'Date: ',
                          style: TextStyle(
                              letterSpacing: 2.0,
                            fontSize:14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                          Text(
                            '04/03/2023',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                  ),
                  ),
                ),
              ],
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Card(
                      color: Colors.blue[200],
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text(
                            'Time: ',
                            style: TextStyle(
                                letterSpacing: 2.0,
                              fontSize:14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            Text(
                              '8.30 AM',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Card(
                      color: Colors.blue[200],
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text(
                            'Venue: ',
                            style: TextStyle(
                                letterSpacing: 2.0,
                              fontSize:14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            Text(
                              'UCSC Premises',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Card(
                      color: Colors.blue[200],
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text(
                            'Description: ',
                            style: TextStyle(
                                letterSpacing: 2.0,
                              fontSize:14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            Text(
                              'The 2nd workshop of the MADHACK will be held on 4th March 2023.',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
        ),
      ),
      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex, // highlight the current icon
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
