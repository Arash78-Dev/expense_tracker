import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
  transportation,
  entertainment,
  shopping,
  other
}

final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.airplanemode_active,
  Category.leisure: Icons.beach_access,
  Category.work: Icons.work,
  Category.transportation: Icons.directions_bus,
  Category.entertainment: Icons.movie,
  Category.shopping: Icons.shopping_cart,
  Category.other: Icons.category,
};

class Expense {
  Expense(
      {required this.date,
      required this.title,
      required this.amount,
      required this.category});

  final String title;
  final double amount;
  String id = uuid.v4();

  final DateTime date;
  final Category category;

  String get formatterDate {
    return formatter.format(date);
  }
}
