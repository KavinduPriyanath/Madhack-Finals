import 'package:flutter/material.dart';
import 'package:login_flutter/Society/society_main.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int _currentPageIndex = 1; // track the current page index

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

  void editProfile() {
    Navigator.pushNamed(context, "/editprofile");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IEEE Student Branch"),
      ),

      //body
      body: Padding(

        padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 30.0),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Center(
                child: Image(
                  image: AssetImage('assets/IEEE-background.jpg'),
                  height: 200,
                  width: 200,
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
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
                              'The IEEE Student Branch of University of Colombo School of Computing was established in 2011 and has achieved great success during the past few years. The student branch has been formed with the participation and contribution of all four batches of University of Colombo School of Computing and it has organized many activities to enhance professional development of the students.',

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
            SizedBox(height: 30,),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[600],
                ),
                onPressed:editProfile,
                child: Text('Edit Content'),
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

