import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import 'add_transaction_screen.dart';
import 'widgets/transaction_tile.dart';
import 'widgets/summary_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Hello, David", style: TextStyle(color: Colors.black)),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SummaryChart(
                  income: controller.totalIncome,
                  expense: controller.totalExpense,
                ),
                const SizedBox(height: 20),
                const Text("Recent transactions",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.transactions.length,
                    itemBuilder: (context, index) {
                      final tx = controller.transactions[index];
                      return TransactionTile(tx: tx);
                    },
                  ),
                )
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddTransactionScreen()),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
