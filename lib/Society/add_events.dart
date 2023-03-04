import 'package:flutter/material.dart';


class AddSocietyEvents extends StatefulWidget {
  const AddSocietyEvents({Key? key}) : super(key: key);

  @override
  State<AddSocietyEvents> createState() => _AddSocietyEventsState();
}

class _AddSocietyEventsState extends State<AddSocietyEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Events"),
      ),
    );
  }
}
