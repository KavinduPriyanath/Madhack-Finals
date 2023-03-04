import 'package:flutter/material.dart';

class UndergraduateMain extends StatefulWidget {
  const UndergraduateMain({Key? key}) : super(key: key);

  @override
  State<UndergraduateMain> createState() => _UndergraduateMainState();
}

class _UndergraduateMainState extends State<UndergraduateMain> {

  Future<void> _gotoStore() async {
    // TODO: Implement navigation
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Undergraduate Home"),
      ),
        body: Center(child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(25),
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _gotoStore,
              icon: Icon(
                Icons.store,
                size: 24.0,
              ),
              label: Text('Go to Store'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(25),
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month,
                size: 24.0,
              ),
              label: Text('View Events'),
            ),
          ),
          Text ('\n'),
          Text ('\n'),
          Text(
            'Today',
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),

        Container(
            margin: EdgeInsets.all(25),
            height: 150,
            width: double.infinity,
            color: Colors.blue,

          child: Text(
            'Today',
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),

        Container(
            margin: EdgeInsets.all(25),
            height: 150,
            width: double.infinity,
            color: Colors.blue,
        ),
        ]
        ))
    );
  }
}

