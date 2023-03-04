import 'package:firebase_core/firebase_core.dart';
import 'package:login_flutter/Auth/main_page.dart';
import 'package:login_flutter/Lecturer/lecturer_main.dart';
import 'package:login_flutter/Pages/home_page.dart';
import 'package:login_flutter/Society/add_events.dart';
import 'package:login_flutter/Society/society_main.dart';
import 'package:login_flutter/Undergraduates/undergraduate_main.dart';
import 'Society/edit_profile.dart';
import 'Society/view_event.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showLoginPage = true;

  void ToggleScreens() {

    setState(() {
      showLoginPage = !showLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/currentMain",
      home: MainPage(),
      routes: {
        '/dwd' : (context) => MainPage(),
        '/currentMain' : (context) => HomePage(),
        '/lecturermain': (context) => LecturerMain(),
        '/undergraduatemain': (context) => UndergraduateMain(),
        '/societymain': (context) => SocietyMain(),
        '/createevents': (context) => AddSocietyEvents(),
        '/viewevents': (context) => ViewSocietyEvents(),
        '/editprofile': (context) => EditProfile(),
      },
    );
  }
}
