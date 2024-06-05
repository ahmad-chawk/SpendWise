import 'package:SpendWise/models/expense.dart';
import 'package:SpendWise/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemove,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemove(expenses[index]);
          },
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.5),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          child: ExpenseItem(
            expenses[index],
          )),
    );
  }
}
