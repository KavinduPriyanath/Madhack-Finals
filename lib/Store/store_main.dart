// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class StoreMain extends StatefulWidget {
//   const StoreMain({Key? key}) : super(key: key);
//
//   @override
//   State<StoreMain> createState() => _StoreMainState();
// }
//
// class _StoreMainState extends State<StoreMain> {
//   void canteenMain() {
//     Navigator.pushNamed(context, "/canteenmain");
//   }
//
//   void stationaryMain() {
//     Navigator.pushNamed(context, "/stationarymain");
//   }
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Store"),
//       ),


      // body:Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: <Widget>[
      //       GestureDetector(
      //         onTap: canteenMain,
      //         child: Padding(
      //           padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
      //           child: Card(
      //             color: Colors.blue[200],
      //             child: Padding(
      //               padding: const EdgeInsets.all(10),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.fastfood_sharp,
      //                   ),
      //                   SizedBox(height: 16.0),
      //                   Text(
      //                       'Canteen'
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //
      //       GestureDetector(
      //         onTap: stationaryMain,
      //         child: Padding(
      //           padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
      //           child: Card(
      //             color: Colors.blue[200],
      //             child: Padding(
      //               padding: const EdgeInsets.all(10),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.book_outlined,
      //                   ),
      //                   SizedBox(height: 16.0),
      //                   Text(
      //                       'Shop'
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   backgroundColor: Colors.grey[200],
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "Home",
      //         backgroundColor: Colors.blueAccent
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: "Person",
      //         backgroundColor: Colors.blueAccent
      //     ),
      //   ],
      //   onTap: (index) {
      //
      //     if (index == 1) {
      //       FirebaseAuth.instance.signOut();
      //     }
      //
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //
      //
      //   },
      // ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_flutter/Auth/auth_page.dart';
import 'package:login_flutter/Lecturer/lecturer_main.dart';
import 'package:login_flutter/Pages/home_page.dart';
import 'package:login_flutter/Society/society_main.dart';
import 'package:login_flutter/Store/store_main.dart';
import 'package:login_flutter/Undergraduates/undergraduate_main.dart';

class StoreMain extends StatefulWidget {
  const StoreMain({Key? key}) : super(key: key);

  @override
  State<StoreMain> createState() => _StoreMainState();
}

class _StoreMainState extends State<StoreMain> {



  void canteenMain() {
    Navigator.pushNamed(context, "/canteenmain");
  }

  void stationaryMain() {
    Navigator.pushNamed(context, "/stationarymain");
  }

  int _currentIndex = 0;

  final studentCollection = FirebaseFirestore.instance.collection('user');

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Undergraduate Home"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: studentCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final studentDocs = snapshot.data?.docs;
            var studentData;

            if (studentDocs != null){
              int length = studentDocs.length;

              for(int i=0; i < length; i++) {
                studentData = studentDocs?[i].data() as Map<String, dynamic>;
                if (studentData["email"] == user.email!) {
                  if (studentData['role'] == "store") {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          GestureDetector(
                            onTap: canteenMain,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
                              child: Card(
                                color: Colors.blue[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fastfood_sharp,
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                          'Canteen'
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            // color: Colors.black87,
                              child: TextButton(

                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  shape: CircleBorder(),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/addfoods");
                                },
                              ),
                          ),

                          GestureDetector(
                            onTap: stationaryMain,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
                              child: Card(
                                color: Colors.blue[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.book_outlined,
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                          'Shop'
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            // color: Colors.black87,
                            child: TextButton(

                              style: TextButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/addstationary');
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          GestureDetector(
                            onTap: canteenMain,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
                              child: Card(
                                color: Colors.blue[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fastfood_sharp,
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                          'Canteen'
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: stationaryMain,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
                              child: Card(
                                color: Colors.blue[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.book_outlined,
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                          'Shop'
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  //print(studentData['role']);
                }
              }
            }

            return Text("Couldn't find the role");
          } else {
            return AuthPage();
          }
        },
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

