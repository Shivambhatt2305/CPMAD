import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Total Capacity:'),
                Text('Currently Available:'),
                Text('Per seat price:'),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Qty',
                      labelText: 'Qty',
                    ),
                  ),
                ),
                Text('Amount:'),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
