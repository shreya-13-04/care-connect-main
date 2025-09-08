import 'package:careconnect/customer/HomePage/demo.dart';
import 'package:careconnect/customer/LoginSetup/login.dart';
import 'package:careconnect/loginHomepage/ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../firebase_options.dart';

import 'dart:developer' as devtools show log;

class Signup extends StatelessWidget {
  const Signup({super.key});

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
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _dob;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _dob = TextEditingController();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _dob.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
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
            ).push(MaterialPageRoute(builder: (context) => Hpage1()));
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
                  "Let's Get Started",
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
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
                    controller: _firstName,
                    enableSuggestions: false,
                    autocorrect: false,

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
                  const SizedBox(height: 20),
                  Text(
                    'LastName',
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
                    controller: _lastName,

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

                  //email
                  //wqdaezfgvrdzgesrdgv
                  const SizedBox(height: 20),
                  Text(
                    'Email',
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
                    keyboardType: TextInputType.emailAddress,
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

                  // password
                  //wqdaezfgvrdzgesrdgv
                  const SizedBox(height: 20),
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
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  ///////forget password

                  // Forgot Password Button aligned right

                  //login
                  const SizedBox(height: 30), // Login Button (Centered)
                  //signup
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
                        setState(() {
                          _errorMessage = '';
                        });
                        // Navigate to HomePage (demo.dart)
                        await Firebase.initializeApp(
                          options: DefaultFirebaseOptions.currentPlatform,
                        );
                        final firstName = _firstName.text;
                        final lastName = _lastName.text;
                        final dob = _dob.text;
                        final email = _email.text;
                        final password = _password.text;
                        try {
                          final userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                          print(userCredential);

                          User? user = userCredential.user;
                          if (user == null) {
                            return;
                          }
                          if (user?.emailVerified ?? false) {
                            //print('you are verified');
                          } else {
                            //print('you are not verified');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EmailVerification(),
                              ),
                            );
                          }

                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .set({
                                'firstName': firstName,
                                'lastName': lastName,
                                'dateOfBirth': dob,
                                'email': email,
                                'createdAt': FieldValue.serverTimestamp(),
                              });
                          devtools.log(userCredential.toString());
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            //await showErrorDialog(
                            //  context,
                            // 'Weak password. Please enter a stronger password.',
                            //);
                            //throw WeakPasswordAuthException();
                            //devtools.log('Weak password');
                            setState(() {
                              _errorMessage = 'Error: ${e.code}';
                            });
                          } else if (e.code == 'email-already-in-use') {
                            //throw EmailAlreadyInUseAuthException();
                            devtools.log('Email already in use');
                            setState(() {
                              _errorMessage = 'Error: ${e.code}';
                            });
                          } else if (e.code == 'invalid-email') {
                            //throw InvalidEmailAuthException();
                            devtools.log('Invalid email');
                            setState(() {
                              _errorMessage = 'Error: ${e.code}';
                            });
                          } else {
                            //throw GenericAuthException();
                            devtools.log(e.code);
                            setState(() {
                              _errorMessage = 'Error: ${e.code}';
                            });
                          }
                        }
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
                  //login pagebnvvv
                  const SizedBox(height: 25),
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
                          MaterialPageRoute(builder: (context) => Login()),
                        );
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _emailVerificationState();
}

class _emailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email Verification')),
      body: Column(
        children: [
          const Text(
            'A verification email has been sent to your email address.',
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.currentUser?.sendEmailVerification();
              print('Verification email sent again');
            },
            child: const Text('Resend Verification Email'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }
}
