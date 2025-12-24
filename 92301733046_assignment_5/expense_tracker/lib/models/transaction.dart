class Transaction {
  String? id;
  String title;
  String type; // "income" or "expense"
  double amount;
  DateTime date;

  Transaction({
    this.id,
    required this.title,
    required this.type,
    required this.amount,
    required this.date,
  });

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  // Create from Firestore Document
  factory Transaction.fromMap(Map<String, dynamic> map, String id) {
    return Transaction(
      id: id,
      title: map['title'] ?? '',
      type: map['type'] ?? 'expense',
      amount: (map['amount'] ?? 0).toDouble(),
      date: DateTime.parse(map['date']),
    );
  }
}
