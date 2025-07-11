import 'package:flutter/material.dart';
import 'package:expense/models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  Icon _getCategoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return const Icon(Icons.fastfood);
      case Category.travel:
        return const Icon(Icons.flight);
      case Category.leisure:
        return const Icon(Icons.movie);
      case Category.work:
        return const Icon(Icons.work);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat.yMMMd();

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${expense.amount.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          expense.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(formatter.format(expense.date)),
        trailing: _getCategoryIcon(expense.category),
      ),
    );
  }
}
