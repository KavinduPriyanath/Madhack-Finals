import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_flutter/Pages/role_home.dart';
import '../Pages/home_page.dart';
import '../Pages/login_page.dart';
import 'auth_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 
  List<String> docIDs = [];
  
  // Future getDocId() async {
  //   await FirebaseFirestore.instance.collection('user').get().then(
  //           (snap) => snap.docs.forEach(
  //                   (document) {
  //                     print(document.reference);
  //                   }));
  // }

  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return RoleRedirect();
        } else {
          return AuthPage();
        }
      },
      ),
    );
  }
}
