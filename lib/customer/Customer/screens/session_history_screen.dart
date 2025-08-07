import 'package:flutter/material.dart';

class SessionHistoryScreen extends StatelessWidget {
  const SessionHistoryScreen({super.key});

  final List<Map<String, String>> mockSessions = const [
    {
      "date": "2025-08-01",
      "caregiver": "Priya Sharma",
      "status": "Completed",
      "amount": "₹800",
    },
    {
      "date": "2025-08-04",
      "caregiver": "Anita Devi",
      "status": "Scheduled",
      "amount": "₹950",
    },
    {
      "date": "2025-08-05",
      "caregiver": "Ravi Kumar",
      "status": "Completed",
      "amount": "₹700",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Session History'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: mockSessions.length,
        itemBuilder: (context, index) {
          final session = mockSessions[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Icon(
                session['status'] == 'Completed'
                    ? Icons.check_circle
                    : Icons.schedule,
                color: session['status'] == 'Completed'
                    ? Colors.green
                    : Colors.orange,
              ),
              title: Text(
                session['caregiver'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Date: ${session['date']} \nStatus: ${session['status']}',
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    session['amount'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      // Later: download invoice logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Invoice download not yet implemented.'),
                        ),
                      );
                    },
                    child: const Text(
                      'Invoice',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
