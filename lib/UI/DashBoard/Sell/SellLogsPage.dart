
import 'package:flutter/material.dart';

import '../../../Models/sell.dart';
import 'List/SellList.dart';
/// sell Logs page
class SellLogsPage extends StatelessWidget {
  /// constructor
   SellLogsPage({super.key});

   /// return sell Logs
   final List<SellModel>sells=<SellModel>[

   ];
  @override
  Widget build(BuildContext context) {
    return SellList(sells: sells, title: 'Sell Logs',);
  }
}
