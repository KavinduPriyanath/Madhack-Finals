import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CanteenMain extends StatefulWidget {
  const CanteenMain({Key? key}) : super(key: key);

  @override
  State<CanteenMain> createState() => _CanteenMainState();
}

class _CanteenMainState extends State<CanteenMain> {

  void orderCanteen() {
    Navigator.pushNamed(context, "/canteenorder");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canteen"),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.fromLTRB(45.0, 10, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(
                'Meals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/specialorder');
                  },
                  child: Text('Spectial order'),
                ),]
            ),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/singleorder');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.blue[200],
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Image.asset('assets/string-hoppers.jpg',
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
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.blue[200],
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Image.asset('assets/paratha.jpg',
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.blue[200],
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Image.asset('assets/rice_and_curry.jpeg',
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.blue[200],
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Image.asset('assets/fried_rice.jpg',
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
                Text(
                  'Shorteats',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],

            ),
          ),

        ],
      ),

      // body: SafeArea(
      // child: GridView.count(
      //   crossAxisCount: 2,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: GestureDetector(
      //         onTap: orderCanteen,
      //         child: Card(
      //           color: Colors.blue[200],
      //           child: Column(
      //             children: [
      //               ListTile(
      //                 title: Text('String Hoppers - Breakfast',
      //                   textAlign: TextAlign.center,),
      //               ),
      //               Image.asset('assets/string-hoppers.jpg',
      //                 height: 120,
      //                 width: 120,),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: GestureDetector(
      //         onTap: orderCanteen,
      //         child: GestureDetector(
      //           onTap: orderCanteen,
      //           child: Card(
      //             color: Colors.blue[200],
      //             child: Column(
      //               children: [
      //                 ListTile(
      //                   title: Text('Paratha - Breakfast',
      //                     textAlign: TextAlign.center,),
      //                 ),
      //                 Image.asset('assets/paratha.jpg',
      //                 height: 120,
      //                 width: 120,),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: GestureDetector(
      //         onTap: orderCanteen,
      //         child: Card(
      //           color: Colors.blue[200],
      //           child: Column(
      //             children: [
      //               ListTile(
      //                 title: Text('Rice and Curry - Lunch',
      //                   textAlign: TextAlign.center,),
      //               ),
      //               Image.asset('assets/rice_and_curry.jpeg',
      //                 height: 120,
      //                 width: 120,),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: GestureDetector(
      //         onTap: orderCanteen,
      //         child: Card(
      //           color: Colors.blue[200],
      //           child: Column(
      //             children: [
      //               ListTile(
      //                 title: Text('Fried Rice - Lunch',
      //                 textAlign: TextAlign.center,),
      //               ),
      //               Image.asset('assets/fried_rice.jpg',
      //                 height: 120,
      //                 width: 120,),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // ),
    );
  }
}
