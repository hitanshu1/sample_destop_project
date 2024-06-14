

import 'package:flutter/material.dart';

import '../../../../Models/GiftCard.dart';
import '../../../../Models/Widgets/Label.dart';
import '../../../../Widgets/Widgets.dart';
/// Gift card widget
class GiftCardWidget extends StatelessWidget {
  /// index of the List
  final int index;
  /// sell data
  final GiftCard? data;
  /// on selected current gift card
  final VoidCallback? onSelected;
  /// is index selected
  final bool isSelected;
  /// constructor
  const GiftCardWidget({super.key,this.data,this.isSelected=false,required this.index,this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListCard(
      index: index,
      isSelected: isSelected,
      onSelected: onSelected,
      labels: <Label>[
        Label('Card No', data?.cardNo),
        Label('Customer Name', data?.customerName),
        Label('GiftCard value', data?.value, ),
        Label('Balance', data?.balance, ),
        Label('Expiry Date', data?.expiryDate, ),

      ],
    );
  }
}
