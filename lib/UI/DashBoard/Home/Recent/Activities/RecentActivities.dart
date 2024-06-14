
import 'package:flutter/material.dart';
import '../../../../../Models/sell.dart';
import '../../../Sell/List/SellList.dart';

/// recent Activity list widget
class RecentActivities extends StatefulWidget {
  /// constructor
  const RecentActivities({super.key});

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  List<SellModel>recentActivities=<SellModel>[
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
    return SellList(sells: recentActivities, title: 'Recent Activities',
    isScrollable: false,);
  }


}
