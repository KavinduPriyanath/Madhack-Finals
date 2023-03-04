import 'package:firebase_core/firebase_core.dart';
import 'package:login_flutter/Auth/main_page.dart';
import 'package:login_flutter/Lecturer/lecturer_main.dart';
import 'package:login_flutter/Pages/home_page.dart';
import 'package:login_flutter/Society/society_main.dart';
import 'package:login_flutter/Undergraduates/undergraduate_main.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/currentMain",
      home: HomePage(),
      routes: {
        '/dwd' : (context) => MainPage(),
        '/currentMain' : (context) => HomePage(),
        '/lecturermain': (context) => LecturerMain(),
        '/undergraduatemain': (context) => UndergraduateMain(),
        '/societymain': (context) => SocietyMain(),
      },
    );
  }
}
