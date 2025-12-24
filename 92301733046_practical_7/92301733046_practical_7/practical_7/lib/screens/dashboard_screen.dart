import 'package:flutter/material.dart';
import '../footer.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("E-Book Dashboard")),
      body: Center(child: Text("E-Book Dashboard UI here")),
      bottomNavigationBar: const FooterText(),
    );
    
  }
}
