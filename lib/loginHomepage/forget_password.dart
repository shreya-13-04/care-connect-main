import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConformationPage extends StatefulWidget {
  const ConformationPage({super.key});

  @override
  State<ConformationPage> createState() => _ConformationPageState();
}

class _ConformationPageState extends State<ConformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Sent'),
        // Automatically adds a back button, but we can also handle it manually.
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 80.0,
              ),
              const SizedBox(height: 20),
              const Text(
                'A password reset link has been sent to your email.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Didn't receive the email?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  try {
                    //  await FirebaseAuth.instance.sendPasswordResetEmail(
                    //  email: _email.text,
                    // );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    // SnackBar(content: Text(_email.text.trim())),
                    // );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //const SnackBar(
                    // content: Text(
                    //"Password reset link sent to email",
                    // ),
                    //),
                    //  );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${e.toString()}")),
                    );
                  }
                  // Navigate back to the previous page (the ForgotPasswordPage).
                },
                child: const Text('Send Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
