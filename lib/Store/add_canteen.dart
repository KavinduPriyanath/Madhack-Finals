// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddFoods extends StatefulWidget {
  const AddFoods({Key? key}) : super(key: key);

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

enum SingingCharacter { Yes, No }

class _AddFoodsState extends State<AddFoods> {

  SingingCharacter? _character = SingingCharacter.Yes;

  int _currentIndex = 0;

  final _foodNameController = TextEditingController();
  final _sideDishesController = TextEditingController();
  final _priceController = TextEditingController();


  List<String> type = <String>["Breakfast", "Lunch", "Dinner"];
  String valueChoose = "Breakfast";

  // Future addMeal(String foodName, String sideDishes, String price, String type) async {
  //   await FirebaseFirestore.instance.collection('user').add({
  //     'full name': fullName,
  //     'email': email,
  //     'password': password,
  //     'index no': indexNo,
  //     'course': course,
  //     'year': year,
  //     'role': "undergraduate",
  //   });
  // }

  @override
  void dispose() {
    _foodNameController.dispose();
    _sideDishesController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Foods"),
      ),
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.android_rounded,
                //   size: 100,
                // ),
                Text(
                  "Add Food Items",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
                SizedBox(height: 13,),
                // Text(
                //   "Greetings, fill out the below details",
                //   style: TextStyle(
                //     fontWeight: FontWeight.normal,
                //     fontSize: 18,
                //   ),
                // ),
                // SizedBox(height: 30.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _foodNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Food Name",
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: <BoxShadow>[BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0),
                          blurRadius: 0,
                        )]
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: DropdownButton<String>(
                        hint: Text("Type"),
                        value: valueChoose,
                        onChanged: (String? newValue){
                          setState(() {
                            valueChoose = newValue!;
                          });
                        },
                        items: type.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        underline: Container(),
                        isExpanded: true,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _sideDishesController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Side Dishes",
                        ),
                      ),
                    ),
                  ),
                ),



                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _priceController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Price",
                        ),
                      ),
                    ),
                  ),
                ),

                // text: Text('Availability'),

                Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Yes'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Yes,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('No'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.No,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Upload",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[200],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person",
              backgroundColor: Colors.blueAccent
          ),
        ],
        onTap: (index) {

          if (index == 1) {
            FirebaseAuth.instance.signOut();
          }

          setState(() {
            _currentIndex = index;
          });


        },
      ),
    );
  }
}
