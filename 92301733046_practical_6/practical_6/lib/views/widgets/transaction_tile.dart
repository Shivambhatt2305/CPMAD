import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel tx;
  const TransactionTile({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: tx.type == "income" ? Colors.green[100] : Colors.red[100],
        child: Icon(
          tx.type == "income" ? Icons.arrow_downward : Icons.arrow_upward,
          color: tx.type == "income" ? Colors.green : Colors.red,
        ),
      ),
      title: Text(tx.category),
      subtitle: Text(tx.date.toString().split(" ")[0]),
      trailing: Text(
        "${tx.type == "income" ? "+" : "-"}\$${tx.amount}",
        style: TextStyle(
          color: tx.type == "income" ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
