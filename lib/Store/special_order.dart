import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialOrder extends StatefulWidget {
  const SpecialOrder({Key? key}) : super(key: key);

  @override
  State<SpecialOrder> createState() => _SpecialOrderState();
}

class _SpecialOrderState extends State<SpecialOrder> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _foodTypeController = TextEditingController();
  final _dateController = TextEditingController();
  final _quantityController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform form submission logic here, e.g. send data to server
      print('Submitting form:');
      print('Food Type: $_foodTypeController');
      print('Date: $_dateController');
      print('Quantity: $_quantityController');
    }
  }


  @override
  void dispose() {
    _foodTypeController.dispose();
    _dateController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Stationary"),
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
                  "Special Orders",
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
                      child: TextFormField(
                        controller: _foodTypeController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Food Type",
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Please enter a food type";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _foodTypeController.text = value!;
                        },

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
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Date",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter the date";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _dateController.text = value!;
                        },
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
                      child: TextFormField(
                        controller: _quantityController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Quantity",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter the Quantity";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _quantityController.text = value!;
                        },
                      ),
                    ),
                  ),
                ),





                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Order",
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
    );
  }
}
