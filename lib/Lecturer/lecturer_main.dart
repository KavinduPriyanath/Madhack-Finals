import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/Lecturer/add_lectures.dart';
import 'package:login_flutter/Lecturer/schedule.dart';

class LecturerMain extends StatefulWidget {
  const LecturerMain({Key? key}) : super(key: key);

  @override
  State<LecturerMain> createState() => _LecturerMainState();
}

class _LecturerMainState extends State<LecturerMain> {

  //To go into lecturer's app pages
  void AddLectures() {
    Navigator.pushNamed(context, "/addlectures");
  }

  //To go into undergraduate's app pages
  void AddSubmission() {
    Navigator.pushNamed(context, "/addsubmission");
  }

  //To go into society's app pages
  void Schedule() {
    Navigator.pushNamed(context, "/schedule");
  }

  void Store() {
    Navigator.pushNamed(context, "/schedule");
  }

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecturer's Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 20),
              height: 50,
              width: 200,
              child: ElevatedButton.icon(
                onPressed: AddLectures,
                icon: Icon(
                  Icons.add,
                  size: 24.0,
                ),
                label: Text('Add Lectures'),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 50,
              width: 200,
              child: ElevatedButton.icon(
                onPressed: AddSubmission,
                icon: Icon(
                  Icons.add,
                  size: 24.0,
                ),
                label: Text('Add Submissions'),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 50,
              width: 200,
              child: ElevatedButton.icon(
                onPressed: Schedule,
                icon: Icon(
                  Icons.schedule,
                  size: 24.0,
                ),
                label: Text('My Schedule'),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 50,
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/storeMain");
                },
                icon: Icon(
                  Icons.store,
                  size: 24.0,
                ),
                label: Text('Store'),
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[200],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person",
              backgroundColor: Colors.blueAccent
          ),
        ],
        onTap: (index) {

          if (index == 1) {
            FirebaseAuth.instance.signOut();
          }

          setState(() {
            _currentIndex = index;
          });


        },
      ),
    );
  }
}
