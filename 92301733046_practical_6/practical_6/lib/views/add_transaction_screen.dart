import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import '../models/transaction_model.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final amountController = TextEditingController();
  String category = "Food";
  String type = "expense";
  String paymentType = "Cash";

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Add transaction", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              initialValue: category,
              items: ["Food", "Salary", "Entertainment"].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (val) => setState(() => category = val!),
              decoration: const InputDecoration(labelText: "Category"),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              initialValue: paymentType,
              items: ["Cash", "Credit/Debit Card", "Check"].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (val) => setState(() => paymentType = val!),
              decoration: const InputDecoration(labelText: "Payment Type"),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: () => Get.back(), child: const Text("Draft")),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    final tx = TransactionModel(
                      category: category,
                      amount: double.tryParse(amountController.text) ?? 0.0,
                      date: DateTime.now(),
                      type: category == "Salary" ? "income" : "expense",
                      paymentType: paymentType,
                    );
                    controller.addTransaction(tx);
                    Get.back();
                  },
                  child: const Text("Add"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
