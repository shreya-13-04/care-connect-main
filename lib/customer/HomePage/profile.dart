import 'package:flutter/material.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile avatar with edit button
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('care-connect-main/assets/home/customer.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),

            const Text(
              "Shreya Balasubramani",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("shreya@customer.com",
                style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 20),

            // Contact Info
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blueAccent),
                title: const Text("+91 98765 43210"),
              ),
            ),
            Card(
              child: ListTile(
                leading:
                    const Icon(Icons.location_on, color: Colors.blueAccent),
                title: const Text("Bangalore, India"),
              ),
            ),
            const SizedBox(height: 20),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard("Bookings", "12"),
                _buildStatCard("Completed", "9"),
              ],
            ),
            const SizedBox(height: 20),

            // Settings + Logout
            Card(
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.blueAccent),
                title: const Text("Settings"),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Logout"),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      elevation: 2,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(value,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
