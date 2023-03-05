import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StationaryMain extends StatefulWidget {
  const StationaryMain({Key? key}) : super(key: key);

  @override
  State<StationaryMain> createState() => _StationaryMainState();
}

class _StationaryMainState extends State<StationaryMain> {

  void orderStationary() {
    Navigator.pushNamed(context, "/stationaryorder");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stationary"),
      ),

      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: GestureDetector(
                onTap: orderStationary,
                child: Card(
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Image.asset('assets/t-shirt-1.jpg',
                        height: 80,
                        width: 80,),
                      ListTile(
                        title: Text('1600 Rs',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.0),),

                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: GestureDetector(
                onTap: orderStationary,
                child: Card(
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Image.asset('assets/t-shirt-2.jpg',
                        height: 80,
                        width: 80,),
                      ListTile(
                        title: Text('1750 Rs',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.0),),

                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: GestureDetector(
                onTap: orderStationary,
                child: Card(
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Image.asset('assets/t-shirt-3.webp',
                        height: 80,
                        width: 80,),
                      ListTile(
                        title: Text('2000 Rs',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.0),),

                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: GestureDetector(
                onTap: orderStationary,
                child: Card(
                  color: Colors.blue[200],
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Image.asset('assets/t-shirt-4.jpeg',
                        height: 80,
                        width: 80,),
                      ListTile(
                        title: Text('1600 Rs',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.0),),

                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
