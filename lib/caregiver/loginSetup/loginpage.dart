import 'package:careconnect/caregiver/homePage/demo.dart';
import 'package:careconnect/caregiver/loginSetup/signpage.dart';
import 'package:careconnect/customer/HomePage/demo.dart';
import 'package:careconnect/customer/HomePage/homePage.dart';
import 'package:careconnect/loginHomepage/ui.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:careconnect/customer/LoginSetup/signup.dart';
import '../../firebase_options.dart';
import 'package:careconnect/customer/LoginSetup/signup.dart';
import 'dart:developer' as devtools show log;
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _HomepageState();
}

class _HomepageState extends State<MyHomePage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      //bottomNavigationBar: _signup(context),
      appBar: AppBar(
        title: Text('CareConnect'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const Hpage1()));
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Color(0xffF7F7F9),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Hello Again,',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,

                      //hintText: 'mahdiforwork@gmail.com',
                      // hintStyle: const TextStyle(
                      // color: Color(0xff6A6A6A),
                      // fontWeight: FontWeight.normal,
                      // fontSize: 14,
                      //),
                      fillColor: const Color(0xffF7F7F9),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  //wqdaezfgvrdzgesrdgv
                  const SizedBox(height: 30),
                  Text(
                    'Password',
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '',
                      hintStyle: const TextStyle(
                        color: Color(0xff6A6A6A),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      fillColor: const Color(0xffF7F7F9),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  ///////forget password
                  const SizedBox(height: 8),

                  // Forgot Password Button aligned right
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () async {
                        if (_email.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please enter your email first"),
                            ),
                          );
                          return;
                        }
                        try {
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: _email.text,
                          );
                          // ScaffoldMessenger.of(context).showSnackBar(
                          // SnackBar(content: Text(_email.text.trim())),
                          // );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Password reset link sent to email",
                              ),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error: ${e.toString()}")),
                          );
                        }
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //login
                  const SizedBox(height: 50),

                  // Login Button (Centered)
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0D6EFD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 16,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        await Firebase.initializeApp(
                          options: DefaultFirebaseOptions.currentPlatform,
                        );
                        final email = _email.text;
                        final password = _password.text;
                        try {
                          final userCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Demo2()),
                          );
                          devtools.log(userCredential.toString());
                          print(userCredential.user);
                        } on FirebaseAuthException catch (e) {
                          devtools.log(e.code);
                        }
                        // Navigate to HomePage (demo.dart)
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  //signup
                  const SizedBox(height: 30),

                  // Login Button (Centered)
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0D6EFD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 16,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Navigate to HomePage (demo.dart)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage1(),
                          ),
                        );
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
