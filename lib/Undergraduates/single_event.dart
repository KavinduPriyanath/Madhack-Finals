import 'package:flutter/material.dart';

class SingleEvent extends StatefulWidget {
  const SingleEvent({Key? key}) : super(key: key);

  @override
  State<SingleEvent> createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Padura 2023"),
      ),

      body: Center(child: Column(children: <Widget>[
        Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image (
                image: AssetImage('assets/padura.jpg'),
                height: 200,
                width: 200,
              )
          ),

        Container(
          margin: EdgeInsets.all(25),
          height: 150,
          width: double.infinity,
          color: Colors.blue[200],

          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text (
                "Date - 05/03/2023 \nTime - 07.00 PM \nVenue - Science Building Premises \nDescription - Padura 2023 organized by UCSC"
              ),
          ),
        ),
      ],
      )),
    );
  }
}
