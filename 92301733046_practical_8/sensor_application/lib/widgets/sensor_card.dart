import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  final String title;
  final String value;

  const SensorCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Text(value, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
