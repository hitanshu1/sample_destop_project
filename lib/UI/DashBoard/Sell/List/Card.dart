
import 'package:flutter/material.dart';

import '../../../../Models/Widgets/Label.dart';
import '../../../../Models/sell.dart';
import '../../../../Widgets/Widgets.dart';

/// list Card for sell list
class SellCard extends StatelessWidget {
  ///constructor
  /// current sellList index
  final int index;
  /// sell data
  final SellModel? data;
  /// on selected current sell
  final VoidCallback? onSelected;
  /// is index selected
  final bool isSelected;
  /// constructor
  const SellCard({
    super.key,
    required this.index,
    this.data,
    this.onSelected,
    this.isSelected=false
  });

  @override
  Widget build(BuildContext context) {
    return ListCard(
      index: index,
      isSelected: isSelected,
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
