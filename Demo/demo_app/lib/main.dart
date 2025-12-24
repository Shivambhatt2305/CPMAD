import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            height: 38,
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF202C33),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white54),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          actions: const [
            Icon(Icons.more_vert),
            SizedBox(width: 10),
            Icon(Icons.notifications),
            SizedBox(width: 10),
            Icon(Icons.camera_alt),
          ],
        ),
        body: const Center(
          child: Text(
            "AppBar Search Output",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      theme: ThemeData.dark(),
    );
  }
}
