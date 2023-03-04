import 'package:flutter/material.dart';

class ViewSocietyEvents extends StatefulWidget {
  const ViewSocietyEvents({Key? key}) : super(key: key);

  @override
  State<ViewSocietyEvents> createState() => _ViewSocietyEventsState();
}

class _ViewSocietyEventsState extends State<ViewSocietyEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
    );
  }
}
