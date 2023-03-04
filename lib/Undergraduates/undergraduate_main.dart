import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UndergraduateMain extends StatefulWidget {
  const UndergraduateMain({Key? key}) : super(key: key);

  @override
  State<UndergraduateMain> createState() => _UndergraduateMainState();
}

class _UndergraduateMainState extends State<UndergraduateMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Undergraduate Main"),
      ),
      body: MaterialButton(onPressed: () {
        FirebaseAuth.instance.signOut();
      },
      child: Text("logout"),
      ),
    );
  }
}
