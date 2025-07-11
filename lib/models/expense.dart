import 'package:uuid/uuid.dart';

final uuid = const Uuid();
enum Category {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}

