
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/posPageController.dart';
import 'CardDetails.dart';
import 'ProductList.dart';


/// Pos page contains product List and cart details
/// [ProductList] contains all products list
/// [CartDetails] contains customer details ,selected products , summery and payment buttons

class PosPage extends StatelessWidget {
  /// constructor
  const PosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosPageController>(
      builder: (PosPageController gxValues) => Row(
            children: <Widget>[
              Expanded(flex: 2, child: ProductList()),

              Expanded(child: CartDetails()),
            ],
          )
    );
  }
}
