import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CareConnect Home'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            _buildNavButton(
              context,
              title: 'Book a Caregiver',
              icon: Icons.add_circle_outline,
              routeName: '/booking',
            ),
            _buildNavButton(
              context,
              title: 'Session History',
              icon: Icons.history,
              routeName: '/history',
            ),
            _buildNavButton(
              context,
              title: 'Payments',
              icon: Icons.payment,
              routeName: '/payments',
            ),
            _buildNavButton(
              context,
              title: 'Track Caregiver',
              icon: Icons.location_on,
              routeName: '/tracking',
            ),
            _buildNavButton(
              context,
              title: 'Rate Your Session',
              icon: Icons.star_rate,
              routeName: '/ratings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context,
      {required String title,
      required IconData icon,
      required String routeName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade400,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          minimumSize: const Size.fromHeight(60),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        icon: Icon(icon, size: 26),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
