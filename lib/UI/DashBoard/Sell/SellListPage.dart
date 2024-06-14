
import 'package:flutter/material.dart';

import '../../../Models/sell.dart';
import 'List/SellList.dart';

/// DashBoard sellList Page
class SellListPage extends StatelessWidget {
  /// constructor
   SellListPage({super.key});

   /// sell List
  final List<SellModel>sells=<SellModel>[
    SellModel(
        invoiceID: '12024/0000001',
        customerName: 'Walking Customer',
        amount: 100,
        status: 'Paid',
        date: '2024-05-27'
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SellList(sells: sells, title: 'Sells',);
  }
}
