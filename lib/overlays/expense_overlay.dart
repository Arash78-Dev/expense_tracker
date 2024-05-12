import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

class CreateExpenseOverlay extends StatefulWidget {
  const CreateExpenseOverlay({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;

  @override
  State<CreateExpenseOverlay> createState() {
    return _CreateExpenseOverlay();
  }
}

class _CreateExpenseOverlay extends State<CreateExpenseOverlay> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("title")),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    maxLength: 50,
                    decoration: const InputDecoration(
                        prefixText: '\$', label: Text("amount")),
                  )),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(_selectedDate == null
                      ? "not selected"
                      : dateFormatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ]),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton<Category>(
                items:
                Category.values.map<DropdownMenuItem<Category>>((category) {
                  return DropdownMenuItem<Category>(
                      value: category, child: Text(category.name.toString()));
                }).toList(),
                onChanged: (Category? value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                value: _selectedCategory,
              ),
              Expanded(
                  flex: 1,
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("cancel")),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: _onSaveExpense,
                        child: const Text("save Expenses"))
                  ]))
            ],
          )
        ]));
  }

  void _onSaveExpense() {
    final amount = double.tryParse(_amountController.text);

    final amountIsInvalid = amount == null || amount <= 0;

    if (_titleController.text
        .trim()
        .isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("invalid input"),
              content: const Text("please fill data correctly"),
              actions: [TextButton(onPressed: () {
                Navigator.pop(ctx);
              }, child: const Text("ok"))
              ],
            );
          });

      return;
    }

    widget.addExpense(Expense(
        title: _titleController.text,
        amount: amount,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }
}
