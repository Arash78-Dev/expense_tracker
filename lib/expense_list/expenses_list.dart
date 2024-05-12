import 'package:expense_tracker/expense_list/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({required this.expenseList, super.key});

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: expenseList.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(

            key: ValueKey(expenseList[index]),
            child: ExpenseItem(expense: expenseList[index]));
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 0,
      ),
    );
  }
}
