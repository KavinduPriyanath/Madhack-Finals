import 'package:flutter/material.dart';

class SocietyMain extends StatefulWidget {
  const SocietyMain({Key? key}) : super(key: key);

  @override
  State<SocietyMain> createState() => _SocietyMainState();
}

class _SocietyMainState extends State<SocietyMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Society Page"),
      ),
    );
  }
}
