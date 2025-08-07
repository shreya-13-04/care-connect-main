import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../firebase_options.dart';
import 'package:careconnect/customer/LoginSetup/login.dart';

class SignupPage1 extends StatelessWidget {
  const SignupPage1({super.key});

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
      appBar: AppBar(),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Register as Customer'),

                      TextField(
                        controller: _firstName,
                        decoration: InputDecoration(hintText: 'First Name'),
                      ),
                      TextField(
                        controller: _lastName,
                        decoration: InputDecoration(hintText: 'Last Name'),
                      ),
                      TextField(
                        controller: _dob,
                        decoration: InputDecoration(hintText: 'Date of Birth'),
                      ),
                      TextField(
                        controller: _dob,
                        decoration: InputDecoration(hintText: 'Date of Birth'),
                      ),
                      TextField(
                        controller: _email,
                        decoration: InputDecoration(hintText: 'gmail'),
                      ),
                      TextField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: 'password'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await Firebase.initializeApp(
                            options: DefaultFirebaseOptions.currentPlatform,
                          );
                          final firstName = _firstName.text;
                          final lastName = _lastName.text;
                          final dob = _dob.text;
                          final email = _email.text;
                          final password = _password.text;
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
                                builder: (context) => const EmailVerification(),
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
                          // To print the first name, fetch it from Firestore
                        },

                        child: const Text('Register'),
                      ),

                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              );
            default:
              // Firebase is not initialized yet
              return const Text('Loading...');
          }
        },
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
              ).push(MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }
}
