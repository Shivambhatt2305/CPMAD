import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import '../models/transaction.dart';
import '../widgets/transaction_form.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addTransaction(String title, String type, double amount) {
    final newTx = Transaction(
      title: title,
      type: type,
      amount: amount,
      date: DateTime.now(),
    );
    FirebaseFirestore.instance.collection('transactions').add(newTx.toMap());
  }

  void _openAddForm() {
    showModalBottomSheet(
      context: context,
      builder: (_) => TransactionForm(onAdd: _addTransaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('transactions')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];
          final transactions = docs.map((doc) {
            return Transaction.fromMap(
              doc.data() as Map<String, dynamic>,
              doc.id,
            );
          }).toList();

          double balance = 0;
          for (var tx in transactions) {
            if (tx.type == "income") {
              balance += tx.amount;
            } else {
              balance -= tx.amount;
            }
          }

          return Column(
            children: [
              Card(
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Balance: ₹${balance.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Expanded(child: TransactionList(transactions: transactions)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
