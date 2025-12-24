import 'package:get/get.dart';
import '../models/transaction_model.dart';

class TransactionController extends GetxController {
  var transactions = <TransactionModel>[].obs;

  double get totalIncome => transactions
      .where((t) => t.type == "income")
      .fold(0.0, (sum, t) => sum + t.amount);

  double get totalExpense => transactions
      .where((t) => t.type == "expense")
      .fold(0.0, (sum, t) => sum + t.amount);

  void addTransaction(TransactionModel transaction) {
    transactions.add(transaction);
  }
}
