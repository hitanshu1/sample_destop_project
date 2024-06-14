
import 'package:flutter/material.dart';

import '../../../../../Models/Widgets/Label.dart';
import '../../../../../Models/sell.dart';
import '../../../../../Widgets/Widgets.dart';

/// recent Activity list Card
class RecentActivityCard extends StatelessWidget {
  /// current sellList index
  final int index;
  /// sell data
  final SellModel? data;
  /// on selected current sell
  final VoidCallback? onSelected;
  /// constructor
  const RecentActivityCard({
    super.key,
    required this.index,
    this.data,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListCard(
      index: index,
      onSelected: onSelected,
      labels: <Label>[
        Label('Invoice ID', data?.invoiceID),
        Label('Customer Name', data?.customerName),
        Label('Amount', data?.amount, ),
        Label('Payment Status', data?.status, ),
        Label('Date', data?.date, ),

      ],
    );
  }


}
