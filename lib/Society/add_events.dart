import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/Society/profile.dart';
import 'package:login_flutter/Society/society_main.dart';


class AddSocietyEvents extends StatefulWidget {
  const AddSocietyEvents({Key? key}) : super(key: key);

  @override
  State<AddSocietyEvents> createState() => _AddSocietyEventsState();
}

class _AddSocietyEventsState extends State<AddSocietyEvents> {

  //controllers
  final _eventNameController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _eventTimeController = TextEditingController();
  final _venueController = TextEditingController();
  final _descriptionController = TextEditingController();

  int _currentPageIndex = 0; // track the current page index

  // define a list of pages to navigate to
  final List<Widget> _pages = [    SocietyMain(),    Profile(),  ];

  // update the current page index
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
      if (_currentPageIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SocietyMain()),
        );
      }
      else if (_currentPageIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  String _eventName = '';
  DateTime? _eventDate;
  TimeOfDay? _eventTime;
  String _eventVenue = '';
  String _eventDescription = '';
  File? _image;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform form submission logic here, e.g. send data to server
      print('Submitting form:');
      print('Event name: $_eventName');
      print('Event date: $_eventDate');
      print('Event time: $_eventTime');
      print('Event venue: $_eventVenue');
      print('Event description: $_eventDescription');
      print('Event image: $_image');
    }
  }

  Future<void> _selectImage() async {
    // TODO: Implement image selection logic
  }


  // Future createEvent(String  eventName, DateTime? eventDate, TimeOfDay? eventTime, String eventVenue, String eventDescription) async {
  //   await FirebaseFirestore.instance.collection('event').add({
  //     'event name': eventName,
  //     'event date': eventDate,
  //     'event time': eventTime,
  //     'venue': eventVenue,
  //     'description': eventDescription,
  //   });
  // }
  //
  Future createRecord ({required String eventName, required DateTime? eventDate, required String eventTime, required String eventVenue, required String description}) async {
    final docUser = FirebaseFirestore.instance.collection('event').doc();

    final json = {
      'name': eventName,
      'date': eventDate,
      'time': eventTime,
      'venue': eventVenue,
      'description': description,
    };

    await docUser.set(json);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Events"),
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextFormField(
            controller: _eventNameController,
          decoration: InputDecoration(labelText: 'Event Name'),
          validator: (value) {
          if (value!.isEmpty) {
          return 'Please enter an event name';
          }
          return null;
          },
          onSaved: (value) {
          _eventName = value!;
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
          _eventDate = pickedDate;
          });
          }
          },
          child: IgnorePointer(
          child: TextFormField(
            // controller: _eventDateController,
          decoration: InputDecoration(labelText: 'Event Date'),
          validator: (value) {
          if (_eventDate == null) {
          return 'Please select an event date';
          }
          return null;
          },
          onSaved: (value) {
          // Do nothing
          },
          controller: TextEditingController(
          text: _eventDate == null
          ? ''
              : '${_eventDate!.day}/${_eventDate!.month}/${_eventDate!.year}',
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
          _eventTime = pickedTime;
          });
          }
          },
          child: IgnorePointer(
          child: TextFormField(
          decoration: InputDecoration(labelText: 'Event Time'),
          validator: (value) {
          if (_eventTime == null) {
          return 'Please select an event time';
          }
          return null;
          },
          onSaved: (value) {
          // Do nothing
          },
          controller: TextEditingController(

            text: _eventTime == null ? '' : _eventTime!.format(context),
          ),
          ),
          ),
          ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _venueController,
              decoration: InputDecoration(labelText: 'Venue'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a venue';
                }
                return null;
              },
              onSaved: (value) {
                _eventVenue = value!;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
              onSaved: (value) {
                _eventDescription = value!;
              },
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              // onPressed: _submitForm,
              onPressed: () {
                // final eName = _eventName;
                // final eDate = _eventDate;
                // final eTime = _eventTime;
                // final eVenue = _eventVenue;
                // final eDescription = _eventDescription;
                //
                // createEvent(eName, eDate, eTime, eVenue, eDescription);

                final eName = _eventNameController.text.trim();
                final eDate = _eventDate;
                final eTime = _eventTime.toString();
                final eVenue = _venueController.text.trim();
                final eDescription = _descriptionController.text.trim();

                createRecord(eventName: eName, eventDate: eDate, eventTime: eTime, eventVenue: eVenue, description: eDescription);

                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
          ),
          ),
              ),
            ),

      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex, // highlight the current icon
        onTap: _updatePageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _pickImage {
}
