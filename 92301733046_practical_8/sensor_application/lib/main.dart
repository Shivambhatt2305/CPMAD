import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/sensor_provider.dart';
import 'screens/sensor_dashboard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SensorProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SensorDashboard(),
      ),
    ),
  );
}
