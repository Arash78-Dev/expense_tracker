import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense, super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue,
        child: Center(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      expense.title,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text('\$${expense.amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        const SizedBox(
                          width: 5,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(categoryIcons[expense.category],
                                color: Colors.white),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(expense.formatterDate,
                                style: const TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    )
                  ],
                ))));
  }
}
