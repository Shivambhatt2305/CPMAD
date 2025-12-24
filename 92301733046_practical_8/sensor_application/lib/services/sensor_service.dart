import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/sensor_data.dart';

class SensorService {
  final String apiUrl =
      "https://script.google.com/macros/library/d/1q_N69bRTS1AaLtGvGZOoP_nVDmACC-2jqdRIAE_diNm-Gn3HglEbS-Lb/1";

  Future<SensorData> fetchLatestData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return SensorData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load sensor data");
    }
  }
}
