
import 'package:flutter/material.dart';

import '../../../../Widgets/Widgets.dart';

/// recent withdraw list from store
class RecentWithdraw extends StatelessWidget {
  /// constructor of recentWithdraw
  const RecentWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Widgets.heading(text: 'Recent Withdraw'),
        Widgets.noDataAvailable(),
      ],
    );
  }
}
