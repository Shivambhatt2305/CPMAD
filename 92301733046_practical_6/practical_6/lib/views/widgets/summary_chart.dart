import 'package:flutter/material.dart';

class SummaryChart extends StatelessWidget {
  final double income;
  final double expense;
  const SummaryChart({super.key, required this.income, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Income: \$${income.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.green, fontSize: 16)),
          Text("Spent: \$${expense.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.red, fontSize: 16)),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: expense == 0 ? 0 : expense / (income + expense),
            color: Colors.red,
            backgroundColor: Colors.green.shade100,
          )
        ],
      ),
    );
  }
}
