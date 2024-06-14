import 'package:flutter/material.dart';
import '../../../../Widgets/Widgets.dart';
import 'chart.dart';

/// income vs Expense of the store show with this widget
class IncomeVsExpense extends StatelessWidget {
  /// constructor of IncomeVsExpense
  const IncomeVsExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Widgets.heading(text: 'Income vs Expense - May, 2024'),
        const IncomeVsExpenseChart()
      ],
    );
  }
}
