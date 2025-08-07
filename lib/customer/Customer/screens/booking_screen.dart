import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<String> careTypes = [
    'Elderly Care',
    'Post-operative Care',
    'Disability Support',
    'Home Nursing',
    'Companion Care',
  ];

  String? selectedCareType;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmBooking() {
    if (selectedCareType == null ||
        selectedDate == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields to proceed')),
      );
      return;
    }

    String bookingDetails =
        "Care Type: $selectedCareType\nDate: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}\nTime: ${selectedTime!.format(context)}";

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Booking Confirmed!'),
        content: Text(bookingDetails),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      ),
    );

    // Later: send data to backend API here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Caregiver'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Select Type of Care',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCareType,
              items: careTypes
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  selectedCareType = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Date',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.calendar_today),
              label: Text(
                selectedDate == null
                    ? 'Select Date'
                    : DateFormat('yyyy-MM-dd').format(selectedDate!),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade400,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Time',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickTime,
              icon: const Icon(Icons.access_time),
              label: Text(
                selectedTime == null
                    ? 'Select Time'
                    : selectedTime!.format(context),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade400,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _confirmBooking,
              child: const Text('Confirm Booking'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
