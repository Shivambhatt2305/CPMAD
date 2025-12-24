import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  List color = [
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: List.generate(5, (i) => Container(
                height: MediaQuery.of(context).size.height * 0.16,
                color: color[(count + i) % 10],
              )),
            ),
          ),
          Expanded(
            child: Column(
              children: List.generate(5, (i) => Container(
                height: MediaQuery.of(context).size.height * 0.16,
                color: color[(count + i + 5) % 10],
              )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text('Move up'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              child: Text('Move Down'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}