import 'package:expense_tracker/expense_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/overlays/expense_overlay.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

   @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenseList = [
    Expense(
        category: Category.food,
        amount: 35.50,
        date: DateTime.now(),
        title: "groceries"),
    Expense(
        category: Category.transportation,
        amount: 20.00,
        date: DateTime.now(),
        title: "bus fare"),
    Expense(
        category: Category.entertainment,
        amount: 10.00,
        date: DateTime.now(),
        title: "movie ticket"),
    Expense(
        category: Category.shopping,
        amount: 50.00,
        date: DateTime.now(),
        title: "clothes"),
    Expense(
        category: Category.other,
        amount: 15.00,
        date: DateTime.now(),
        title: "miscellaneous"),
  ];

  void addExpense(Expense expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      expenseList.add(expense);
    });
  }

  void openExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => CreateExpenseOverlay(
              addExpense: addExpense,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("flutter Expense Tracker"),
          actions: [
            IconButton(
                onPressed: openExpenseOverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: Column(children: [
          Expanded(child: ExpenseList(expenseList: expenseList))
        ]));
  }
}
