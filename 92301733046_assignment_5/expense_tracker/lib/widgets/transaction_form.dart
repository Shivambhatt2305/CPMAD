import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, String, double) onAdd;

  const TransactionForm({super.key, required this.onAdd});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String _selectedType = "expense";

  void _submit() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;

    if (title.isEmpty || amount <= 0) return;

    widget.onAdd(title, _selectedType, amount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: "Amount"),
            keyboardType: TextInputType.number,
          ),
          DropdownButton<String>(
            value: _selectedType,
            items: const [
              DropdownMenuItem(value: "expense", child: Text("Expense")),
              DropdownMenuItem(value: "income", child: Text("Income")),
            ],
            onChanged: (value) {
              setState(() {
                _selectedType = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text("Add Transaction"),
          )
        ],
      ),
    );
  }
}
