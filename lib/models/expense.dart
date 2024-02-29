// ignore_for_file: constant_identifier_names

import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  Food,
  Travel,
  Shopping,
  Leisure,
  Unnecessary,
  Miscellaneous,
}

const categoryIcons = {
  Category.Food: Icons.lunch_dining,
  Category.Travel: Icons.flight_takeoff_sharp,
  Category.Shopping: Icons.shopping_bag_outlined,
  Category.Leisure: Icons.movie_filter_sharp,
  Category.Unnecessary: Icons.unpublished_outlined,
  Category.Miscellaneous: Icons.miscellaneous_services_sharp,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}
