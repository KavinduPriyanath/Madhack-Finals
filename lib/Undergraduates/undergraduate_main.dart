import 'package:flutter/material.dart';

class UndergraduateMain extends StatefulWidget {
  const UndergraduateMain({Key? key}) : super(key: key);

  @override
  State<UndergraduateMain> createState() => _UndergraduateMainState();
}

class _UndergraduateMainState extends State<UndergraduateMain> {

  void gotoStore() async {
    Navigator.pushNamed(context, "/gotoStore");
  }
  void viewEvents() async {
    Navigator.pushNamed(context, "/eventsmain");
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
            width: 200,
            child: ElevatedButton.icon(
              onPressed: gotoStore,
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
            width: 200,
            child: ElevatedButton.icon(
              onPressed: viewEvents,
              icon: Icon(
                Icons.calendar_month,
                size: 24.0,
              ),
              label: Text('View Events'),
            ),
          ),

        Divider(
          color: Colors.grey,
          height: 50,
          thickness: 2,
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
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
            color: Colors.blue[200],

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(text:'Submission Deadline \n\n', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextSpan(text:'SCS 2201 - Assignment 02 \nDate: 05/03/2023 \nTime: 12.00AM', style: TextStyle(fontSize: 15))
                ]
              )
            )
          ),
        ),

          Container(
            margin: EdgeInsets.all(25),
            height: 150,
            width: double.infinity,
            color: Colors.blue[200],

            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        children: [
                          TextSpan(text:'Lecture Time \n\n', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          TextSpan(text:'SCS 2201 - Arrays \nDate: 05/03/2023 \nTime: 10.00AM', style: TextStyle(fontSize: 15))
                        ]
                    )
                )
            ),
          ),
        ]
        ))
    );
  }
}

