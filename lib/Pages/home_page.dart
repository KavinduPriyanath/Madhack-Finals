import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //final user = FirebaseAuth.instance.currentUser!;

  //To go into lecturer's app pages
  void lecturerMain() {
    Navigator.pushNamed(context, "/lecturermain");
  }

  //To go into undergraduate's app pages
  void undergraduateMain() {
    Navigator.pushNamed(context, "/undergraduatemain");
  }

  //To go into society's app pages
  void societyMain() {
    Navigator.pushNamed(context, "/societymain");
  }

  void Signout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy Main Page"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: undergraduateMain,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Undergraduates",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),

            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: lecturerMain,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Lecturers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),),
              ),
            ),
            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: Signout,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Canteen",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ),

            SizedBox(height: 15.0,),
            GestureDetector(
              onTap: societyMain,
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("Events",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
