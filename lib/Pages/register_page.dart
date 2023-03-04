import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _indexNoController = TextEditingController();


  List<String> courses = <String>["Computer Science", "Information Systems"];
  List<String> year = <String>["1st year", "2nd year", "3rd year", "4th year"];
  String valueChoose = "Computer Science";
  String valueChoose1 = "1st year";


  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());

      addUserDetails(_fullNameController.text.trim(), _emailController.text.trim(),
      _passwordController.text.trim(), _indexNoController.text.trim(), valueChoose, valueChoose1);
    }
  }

  bool passwordConfirmed () {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //create of of CRUD
  Future addUserDetails(String fullName, String email, String password, String indexNo, String course, String year) async {
    await FirebaseFirestore.instance.collection('user').add({
      'full name': fullName,
      'email': email,
      'password': password,
      'index no': indexNo,
      'course': course,
      'year': year,
      'role': "undergraduate",
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Register",
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
                        controller: _fullNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full Name",
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
                        controller: _indexNoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Index Number",
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
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
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password",
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
                        hint: Text("Course"),
                        value: valueChoose,
                        onChanged: (String? newValue){
                          setState(() {
                            valueChoose = newValue!;
                          });
                        },
                        items: courses.map<DropdownMenuItem<String>>(
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
                        hint: Text("Year"),
                        value: valueChoose1,
                        onChanged: (String? newValue){
                          setState(() {
                            valueChoose1 = newValue!;
                          });
                        },
                        items: year.map<DropdownMenuItem<String>>(
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

                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Sign Up",
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

                SizedBox(height: 20.0,),

                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(width: 4.0,),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text("Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
