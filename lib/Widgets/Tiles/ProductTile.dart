import 'package:flutter/material.dart';

import '../../Models/Product.dart';
import '../Widgets.dart';
/// common product tile of app
class ProductTile extends StatelessWidget {
  /// product details
  final ProductModel product;
  /// onTap product 
  final GestureTapCallback? onTap;
/// constructor
  const ProductTile({super.key, required this.product,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap:onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.local_grocery_store),
            Txt(product.name??''),
            Txt(product.price,toCurrency: true,),
          ],
        ),
      ),
    );
  }
}
