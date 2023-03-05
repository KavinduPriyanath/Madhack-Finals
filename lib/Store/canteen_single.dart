import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

class OrderMain extends StatefulWidget {
  const OrderMain({Key? key}) : super(key: key);

  @override
  State<OrderMain> createState() => _OrderMainState();
}

class _OrderMainState extends State<OrderMain> {

  int simpleIntInput = 0;
  List<String> type = <String>["Chicken", "Fish", "Vegetable"];
  String valueChoose = "Chicken";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),

      body: SingleChildScrollView(
        child: Column(children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Breakfast - Rice and Curry',
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image (
                image: AssetImage("assets/rice_and_curry.jpeg"),
                height: 200,
                width: 200,
              )
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Side Dishes',
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          Container(
            margin: EdgeInsets.all(25),
            height: 100,
            width: double.infinity,
            color: Colors.blue[200],

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text (
                  "Mallum \nSambola \nParippu\nPapadam"
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Preference',
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: 50,
            width: 200,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: DropdownButton<String>(
                    hint: Text("Preference"),
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
          ),


          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Quantity',
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QuantityInput(
                    value: simpleIntInput,
                    onChanged: (value) => setState(() => simpleIntInput = int.parse(value.replaceAll(',', '')))
                ),
                Text(
                    'Value: $simpleIntInput',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                )
              ]
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Total Price: LKR 250.00',
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 20),
            ),
          ),

          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top:30),
              padding: EdgeInsets.all(15.0),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Order",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),),
            ),
          ),
        ],
        ),
      ),

    );
  }
}
