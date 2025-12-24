import 'package:flutter/material.dart';

/// Unit Converter Screen
class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  // Controllers
  final TextEditingController _inputController = TextEditingController();

  // Dropdown values
  String selectedCategory = "Length";
  String fromUnit = "Meter";
  String toUnit = "Kilometer";

  // Result
  double result = 0;

  /// Available categories and units
  final Map<String, List<String>> units = {
    "Length": ["Meter", "Kilometer", "Centimeter", "Millimeter"],
    "Weight": ["Gram", "Kilogram", "Pound"],
    "Temperature": ["Celsius", "Fahrenheit", "Kelvin"],
    "Area": ["Square Meter", "Square Kilometer", "Hectare"],
  };

  /// Conversion Logic
  double convert(double value, String category, String from, String to) {
    if (category == "Length") {
      // Convert everything to meters first
      double inMeters;
      switch (from) {
        case "Meter":
          inMeters = value;
          break;
        case "Kilometer":
          inMeters = value * 1000;
          break;
        case "Centimeter":
          inMeters = value / 100;
          break;
        case "Millimeter":
          inMeters = value / 1000;
          break;
        default:
          inMeters = value;
      }

      // Convert from meters to target unit
      switch (to) {
        case "Meter":
          return inMeters;
        case "Kilometer":
          return inMeters / 1000;
        case "Centimeter":
          return inMeters * 100;
        case "Millimeter":
          return inMeters * 1000;
      }
    } else if (category == "Weight") {
      // Convert everything to grams
      double inGrams;
      switch (from) {
        case "Gram":
          inGrams = value;
          break;
        case "Kilogram":
          inGrams = value * 1000;
          break;
        case "Pound":
          inGrams = value * 453.592;
          break;
        default:
          inGrams = value;
      }

      // Convert grams to target
      switch (to) {
        case "Gram":
          return inGrams;
        case "Kilogram":
          return inGrams / 1000;
        case "Pound":
          return inGrams / 453.592;
      }
    } else if (category == "Temperature") {
      double inCelsius;
      switch (from) {
        case "Celsius":
          inCelsius = value;
          break;
        case "Fahrenheit":
          inCelsius = (value - 32) * 5 / 9;
          break;
        case "Kelvin":
          inCelsius = value - 273.15;
          break;
        default:
          inCelsius = value;
      }

      switch (to) {
        case "Celsius":
          return inCelsius;
        case "Fahrenheit":
          return (inCelsius * 9 / 5) + 32;
        case "Kelvin":
          return inCelsius + 273.15;
      }
    } else if (category == "Area") {
      // Convert everything to square meters
      double inSqMeters;
      switch (from) {
        case "Square Meter":
          inSqMeters = value;
          break;
        case "Square Kilometer":
          inSqMeters = value * 1e6;
          break;
        case "Hectare":
          inSqMeters = value * 10000;
          break;
        default:
          inSqMeters = value;
      }

      switch (to) {
        case "Square Meter":
          return inSqMeters;
        case "Square Kilometer":
          return inSqMeters / 1e6;
        case "Hectare":
          return inSqMeters / 10000;
      }
    }
    return value;
  }

  /// Perform conversion
  void calculate() {
    setState(() {
      double inputValue = double.tryParse(_inputController.text) ?? 0;
      result = convert(inputValue, selectedCategory, fromUnit, toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Unit Converter")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Category selection
            DropdownButton<String>(
              value: selectedCategory,
              items: units.keys
                  .map((cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedCategory = val!;
                  fromUnit = units[selectedCategory]!.first;
                  toUnit = units[selectedCategory]!.last;
                });
              },
            ),

            /// From unit
            DropdownButton<String>(
              value: fromUnit,
              items: units[selectedCategory]!
                  .map((u) => DropdownMenuItem(
                        value: u,
                        child: Text(u),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  fromUnit = val!;
                });
              },
            ),

            /// To unit
            DropdownButton<String>(
              value: toUnit,
              items: units[selectedCategory]!
                  .map((u) => DropdownMenuItem(
                        value: u,
                        child: Text(u),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  toUnit = val!;
                });
              },
            ),

            /// Input field
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter value in $fromUnit",
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              child: const Text("Convert"),
            ),
            const SizedBox(height: 20),

            Text(
              "Result: $result $toUnit",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
