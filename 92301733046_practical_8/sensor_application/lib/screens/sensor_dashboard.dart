import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sensor_provider.dart';
import '../widgets/sensor_card.dart';

class SensorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sensor = Provider.of<SensorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sensor Analytics Dashboard"),
      ),
      body: sensor.isLoading
          ? Center(child: CircularProgressIndicator())
          : sensor.data == null
              ? Center(child: Text("No data available"))
              : ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    SensorCard(
                      title: "Temperature",
                      value: "${sensor.data!.temperature} °C",
                    ),
                    SensorCard(
                      title: "Humidity",
                      value: "${sensor.data!.humidity} %",
                    ),
                    SensorCard(
                      title: "Gas Level",
                      value: "${sensor.data!.gasLevel} %",
                    ),
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => sensor.loadSensorData(),
      ),
    );
  }
}
