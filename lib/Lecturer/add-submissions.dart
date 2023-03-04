import 'package:flutter/material.dart';

class AddSubmission extends StatefulWidget {
  const AddSubmission({Key? key}) : super(key: key);

  @override
  State<AddSubmission> createState() => _AddSubmissionState();
}

class _AddSubmissionState extends State<AddSubmission> {

  int _currentPageIndex = 0; // track the current page index

  // define a list of pages to navigate to
  // final List<Widget> _pages = [    LecturerMain(),  ];

  // update the current page index
  // void _updatePageIndex(int index) {
  //   setState(() {
  //     _currentPageIndex = index;
  //     if (_currentPageIndex == 0) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => LecturerMain()),
  //       );
  //     }
  //     else if (_currentPageIndex == 1) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => Profile()),
  //       );
  //     }
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  String _subjectCode = '';
  DateTime? _date;
  TimeOfDay? _time;



  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform form submission logic here, e.g. send data to server
      print('Submitting form:');
      print('Subject Code: $_subjectCode');
      print('Date: $_date');
      print('Time: $_time');


    }
  }

  Future<void> _selectImage() async {
    // TODO: Implement image selection logic
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Submissions"),
      ),

      //body
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Subject Code',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Subject Code';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _subjectCode = value!;
                  },
                ),

                SizedBox(height: 16.0),
                InkWell(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _date = pickedDate;
                      });
                    }
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),

                      validator: (value) {
                        if (_date == null) {
                          return 'Please select the date';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // Do nothing
                      },
                      controller: TextEditingController(
                        text: _date == null
                            ? ''
                            : '${_date!.day}/${_date!.month}/${_date!.year}',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                InkWell(
                  onTap: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _time = pickedTime;
                      });
                    }
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Time',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),

                      validator: (value) {
                        if (_time == null) {
                          return 'Please select the time';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // Do nothing
                      },
                      controller: TextEditingController(

                        text: _time == null ? '' : _time!.format(context),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),

      //bottom navbar
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentPageIndex, // highlight the current icon
      //   // onTap: (){
      //   // },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}

