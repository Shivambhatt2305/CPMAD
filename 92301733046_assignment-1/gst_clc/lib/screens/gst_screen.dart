import 'package:flutter/material.dart';

/// GST Calculator Screen
class GSTCalculatorScreen extends StatefulWidget {
  const GSTCalculatorScreen({super.key});

  @override
  State<GSTCalculatorScreen> createState() => _GSTCalculatorScreenState();
}

class _GSTCalculatorScreenState extends State<GSTCalculatorScreen> {
  // Controllers for input fields
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();

  // Output values
  double igst = 0, cgst = 0, sgst = 0, totalAmount = 0, actualAmount = 0;

  // Toggle between Case 1 (Actual → Total) and Case 2 (Total → Actual)
  bool isCase1 = true;

  /// Function for GST calculation
  void calculate() {
    setState(() {
      double amount = double.tryParse(_amountController.text) ?? 0;
      double gstPercent = double.tryParse(_gstController.text) ?? 0;

      if (isCase1) {
        // Case 1: Input = Actual Amount
        igst = (amount * gstPercent) / 100;
        cgst = igst / 2;
        sgst = igst / 2;
        totalAmount = amount + igst;
        actualAmount = amount;
      } else {
        // Case 2: Input = Total Amount
        totalAmount = amount;
        actualAmount = amount / (1 + gstPercent / 100);
        igst = totalAmount - actualAmount;
        cgst = igst / 2;
        sgst = igst / 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GST Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Toggle for Case 1 / Case 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Case 1"),
                Switch(
                  value: isCase1,
                  onChanged: (val) {
                    setState(() {
                      isCase1 = val;
                      _amountController.clear();
                    });
                  },
                ),
                const Text("Case 2"),
              ],
            ),

            /// Input Fields
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: isCase1
                    ? "Enter Actual Amount"
                    : "Enter Total Amount",
              ),
            ),
            TextField(
              controller: _gstController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Enter GST %"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculate,
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),

            /// Output Section
            Text("Actual Amount: ₹${actualAmount.toStringAsFixed(2)}"),
            Text("IGST: ₹${igst.toStringAsFixed(2)}"),
            Text("CGST: ₹${cgst.toStringAsFixed(2)}"),
            Text("SGST: ₹${sgst.toStringAsFixed(2)}"),
            Text("Total Amount: ₹${totalAmount.toStringAsFixed(2)}"),

            const Divider(height: 30),

            /// Roll Number based GST% (example: roll_no = 23 → gst% = (23*10)%100 = 30)
            const Text(
              "Roll No GST% Output Example:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("If Roll No = 46 → GST% = (46*10)%100 = 60"),
          ],
        ),
      ),
    );
  }
}
