import 'package:flutter/material.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/session_history_screen.dart';
import 'screens/payment_screen.dart';
// import 'screens/tracking_screen.dart';
// import 'screens/ratings_screen.dart';

void main() {
  runApp(const CareConnectApp());
}

class CareConnectApp extends StatelessWidget {
  const CareConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/booking': (context) => const BookingScreen(),
        '/history': (context) => const SessionHistoryScreen(),
        '/payments': (context) => const PaymentScreen(),
        //'/tracking': (context) => const TrackingScreen(),
        //'/ratings': (context) => const RatingsScreen(),
      },
    );
  }
}
