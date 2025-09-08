import 'package:flutter/material.dart';
import 'package:careconnect/customer/HomePage/notifications.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      home: BottomNavExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.grid_view, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          SizedBox(width: 12),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Punith!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Good morning",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

            // Welcome Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Welcome!\nJoin your nearest Community.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Join")),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Featured Categories
            Text(
              "Featured Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategory(Icons.business_center, "Professional"),
                  _buildCategory(Icons.local_hospital, "Home Health "),
                  _buildCategory(Icons.accessibility_new, "Personal Care"),
                  _buildCategory(Icons.medical_services, "Nursing Assistants"),
                  _buildCategory(Icons.handshake, "Private Duty"),
                  _buildCategory(Icons.diversity_3, "Special Needs"),
                  _buildCategory(Icons.child_care, "Child Care"),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Recommendations
            Text(
              "Recommendations",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            Column(
              children: [
                _buildRecommendation(
                  "Sebastian",
                  "A trained professional with years of experience in providing both medical and emotional support to patients .",
                  "https://i.pravatar.cc/150?img=3",
                  5,
                ),
                _buildRecommendation(
                  "katherine",
                  "Experienced in supporting children and adults with developmental or physical disabilities, providing patience, care, and encouragement",
                  "https://i.pravatar.cc/150?img=5",
                  4,
                ),
                _buildRecommendation(
                  "Steve",
                  "Passionate about child development, ensuring safety, learning, and fun for children while parents are away",
                  "https://i.pravatar.cc/150?img=5",
                  3.5,
                ),
                _buildRecommendation(
                  "Smith",
                  "A supportive figure within the community who connects families with resources, peer support, and group care opportunities",
                  "https://i.pravatar.cc/150?img=5",
                  3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: Colors.black),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  /// New Profile-style Recommendation Widget
  Widget _buildRecommendation(
    String name,
    String bio,
    String imageUrl,
    double rating,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
          SizedBox(width: 16),

          // Profile Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  bio,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),

                // Rating stars
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating.round() ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                      size: 20,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
