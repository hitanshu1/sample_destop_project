
import 'package:flutter/material.dart';

import '../../../Models/Product.dart';
import '../../../Widgets/Widgets.dart';

/// select cart product data
class CartItem extends StatelessWidget {
  /// product details model
  final ProductModel product;
/// constructor
  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Txt(product.name??''),
      subtitle: Txt('Quantity: ${product.quantity??1}'),
      trailing: Txt(product.price,toCurrency: true,),
    );
  }
}
