import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {

  final VoidCallback showRegisterPage;

  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  }

  void registerNow(){
    Navigator.pushNamed(context, "/register");
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                Icon(Icons.school,
                size: 100,
                ),
                Text(
                  "Hello Again",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
                SizedBox(height: 13,),
                Text(
                  "Enhance your university experience",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 30.0,),
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



                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text("Sign In",
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
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(width: 4.0,),
                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        // onTap: registerNow,
                        child: Text("Create Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
