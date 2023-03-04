import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_flutter/Auth/auth_page.dart';
import 'package:login_flutter/Lecturer/lecturer_main.dart';
import 'package:login_flutter/Pages/home_page.dart';
import 'package:login_flutter/Society/society_main.dart';
import 'package:login_flutter/Store/store_main.dart';
import 'package:login_flutter/Undergraduates/undergraduate_main.dart';

class RoleRedirect extends StatefulWidget {
  const RoleRedirect({Key? key}) : super(key: key);

  @override
  State<RoleRedirect> createState() => _RoleRedirectState();
}

class _RoleRedirectState extends State<RoleRedirect> {

  final studentCollection = FirebaseFirestore.instance.collection('user');

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
                if (studentData['role'] == "undergraduate") {
                  return UndergraduateMain();
                } else if (studentData['role'] == "store") {
                  return StoreMain();
                } else if (studentData['role'] == "lecturer") {
                  return LecturerMain();
                } else if (studentData['role'] == "society") {
                  return SocietyMain();
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
    );
  }
}
