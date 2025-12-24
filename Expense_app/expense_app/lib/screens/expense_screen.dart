import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class ExpenseItem {
  final String title;
  final String type; // 'expense' or 'income'
  final double amount;
  final DateTime date;

  ExpenseItem({
    required this.title,
    required this.type,
    required this.amount,
    required this.date,
  });
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<ExpenseItem> _items = [];
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _type = 'expense';
  String _amount = '';

  double get _balance {
    double balance = 0;
    for (var item in _items) {
      if (item.type == 'income') {
        balance += item.amount;
      } else {
        balance -= item.amount;
      }
    }
    return balance;
  }

  void _addExpense() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _items.insert(
          0,
          ExpenseItem(
            title: _title,
            type: _type,
            amount: double.parse(_amount),
            date: DateTime.now(),
          ),
        );
        _title = '';
        _type = 'expense';
        _amount = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _balance.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 28,
                        color: _balance >= 0 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Title'),
                      onSaved: (val) => _title = val ?? '',
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Enter title' : null,
                      initialValue: _title,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField<String>(
                      value: _type,
                      items: const [
                        DropdownMenuItem(
                          value: 'expense',
                          child: Text('Expense'),
                        ),
                        DropdownMenuItem(
                          value: 'income',
                          child: Text('Income'),
                        ),
                      ],
                      onChanged: (val) {
                        setState(() {
                          _type = val ?? 'expense';
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Type'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                      onSaved: (val) => _amount = val ?? '',
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Enter amount';
                        final n = double.tryParse(val);
                        if (n == null || n <= 0) return 'Enter valid amount';
                        return null;
                      },
                      initialValue: _amount,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addExpense,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: _items.isEmpty
                  ? const Center(child: Text('No expenses yet.'))
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return Card(
                          child: ListTile(
                            leading: Icon(
                              item.type == 'income'
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              color: item.type == 'income'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            title: Text(item.title),
                            subtitle: Text(
                              '${item.type[0].toUpperCase()}${item.type.substring(1)} • ${item.date.toLocal().toString().split(".")[0]}',
                            ),
                            trailing: Text(
                              (item.type == 'income' ? '+' : '-') +
                                  item.amount.toStringAsFixed(2),
                              style: TextStyle(
                                color: item.type == 'income'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
