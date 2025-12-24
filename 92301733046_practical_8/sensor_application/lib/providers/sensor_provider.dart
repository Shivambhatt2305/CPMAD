import 'package:flutter/material.dart';

import '../models/sensor_data.dart';
import '../services/sensor_service.dart';

class SensorProvider extends ChangeNotifier {
  final SensorService _service = SensorService();

  SensorData? data;
  bool isLoading = false;

  Future<void> loadSensorData() async {
    isLoading = true;
    notifyListeners();

    data = await _service.fetchLatestData();

    isLoading = false;
    notifyListeners();
  }
}
