class SensorData {
  final double temperature;
  final double humidity;
  final double gasLevel;
  final DateTime timestamp;

  SensorData({
    required this.temperature,
    required this.humidity,
    required this.gasLevel,
    required this.timestamp,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      temperature: json['temperature'].toDouble(),
      humidity: json['humidity'].toDouble(),
      gasLevel: json['gasLevel'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
