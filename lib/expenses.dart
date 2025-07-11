import 'package:expense/models/expense.dart';
import 'package:expense/new_expense.dart';

import 'package:flutter/material.dart';
import 'package:expense/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema Ticket",
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Toolbar widget
      appBar: AppBar(
        title: const Text("Your Expenses"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, // Add new expense logic here

            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("The chart"),
          ExpensesList(expenses: _registeredExpenses),
        ],
      ),
    );
  }
}
