
import 'package:flutter/material.dart';

import '../../../../Widgets/Widgets.dart';
/// recentDeposits use to show recent deposit for the store
class RecentDeposits extends StatelessWidget {
  /// Constructors  class
  const RecentDeposits({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Widgets.heading(text: 'Recent Deposit'),
        Widgets.noDataAvailable(),
      ],
    );
  }
}
