import 'package:flutter/material.dart';

class LecturerMain extends StatefulWidget {
  const LecturerMain({Key? key}) : super(key: key);

  @override
  State<LecturerMain> createState() => _LecturerMainState();
}

class _LecturerMainState extends State<LecturerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecturer Main Page"),
      ),
    );
  }
}
