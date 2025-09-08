import 'package:flutter/material.dart';
import 'package:careconnect/customer/HomePage/notifications.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'profile',
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
  final List<String> contacts = [
    "Sebastian",
    "Katherine",
    "Steve",
    "Smith",
    "Sam",
    "Harry",
  ];

  final List<Map<String, dynamic>> groups = [
    {
      "title": "group1",
      "time": "23 min ago",
      "members": 320,
      "highlight": true,
    },
    {
      "title": "group2",
      "time": "12 min ago",
      "members": 180,
      "highlight": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recent Contacts
            Text(
              "Recent contacts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),

                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            "assets/avatar.png",
                          ), // put placeholder image
                        ),
                        SizedBox(height: 5),
                        Text(contacts[index], style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Conversation",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/avatar.png"),
              ),
              title: Text("Seb"),
              subtitle: Text("As long as it is a payment..."),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChatDetailScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            Text(
              "Your groups",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: groups.length,
                itemBuilder: (context, index) {
                  var group = groups[index];
                  return Card(
                    color: group["highlight"] ? Colors.blue[50] : Colors.white,
                    child: ListTile(
                      title: Text(
                        group["title"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: group["highlight"]
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(group["time"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.group, size: 18),
                          SizedBox(width: 5),
                          Text("${group["members"]}+"),
                          if (group["highlight"])
                            Icon(Icons.star, color: Colors.amber, size: 18),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// --------------------
/// Chat Detail Page
/// --------------------
class ChatDetailScreen extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      "isMe": false,
      "text":
          "As long as it is a payment system with money transactions, it is highly safe…",
      "time": "14:00",
    },
    {
      "isMe": true,
      "text":
          "I think you are quite right. The trial method of credit cards is important for property security.",
      "time": "15:20",
    },
    {"isMe": false, "text": "ok… 😏", "time": "16:20"},
    {
      "isMe": true,
      "text": "Thank you for your reminder, let me learn a lot.",
      "time": "16:23",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/avatar.png")),
            SizedBox(width: 10),
            Text("Seb"),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var msg = messages[index];
                return Align(
                  alignment: msg["isMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: 250),
                    decoration: BoxDecoration(
                      color: msg["isMe"] ? Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      msg["text"],
                      style: TextStyle(
                        color: msg["isMe"] ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: Colors.blue),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
