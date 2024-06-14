
import 'package:flutter/material.dart';

import '../../../Models/sell.dart';
import 'List/SellList.dart';

/// return sell list
class ReturnListPage extends StatelessWidget {
  /// constructor
   ReturnListPage({super.key});

   /// return sell List
  final List<SellModel>sells=<SellModel>[

  ];
  @override
  Widget build(BuildContext context) {
    return SellList(sells: sells, title: 'Return List',);
  }
}
