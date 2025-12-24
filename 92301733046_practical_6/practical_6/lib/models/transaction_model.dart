class TransactionModel {
  final String category;
  final double amount;
  final DateTime date;
  final String type; // income or expense
  final String paymentType; // Cash, Card, Check

  TransactionModel({
    required this.category,
    required this.amount,
    required this.date,
    required this.type,
    required this.paymentType,
  });
}
