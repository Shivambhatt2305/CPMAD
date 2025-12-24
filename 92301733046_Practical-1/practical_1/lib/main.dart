import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical-1', // title of the app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: const HomePage(), 
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello I am Shivam Bhatt',
              style: TextStyle(fontSize: 30, color: Colors.blue), // Color of the Text 'hello hetansh'
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  msg = 'Hello Good Morning Everyone'; // Message to be displayed when button is pressed
                });
              },
              child: const Text('Press Me'),
            ),
            const SizedBox(height: 20),
            Text(
              msg,
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}