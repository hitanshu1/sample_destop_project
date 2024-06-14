import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/Product.dart';

/// PosPage controller use to manage the state of PosPage
class PosPageController extends GetxController {


  /// product search text field controller
  TextEditingController searchTextController = TextEditingController();

  /// search product list depending upon search text
  List<ProductModel> get searchProducts {
    if (searchTextController.text.isNotEmpty) {
      return _allProducts
          .where((ProductModel e) => (e.name??'').toLowerCase().contains(searchTextController.text))
          .toList();
    } else {
      return _allProducts;
    }
  }

  final List<ProductModel> _allProducts = <ProductModel>[
    ProductModel(name: 'Home Delivery', price: 0),
    ProductModel(name: 'Banana', price: 100),
  ];

  /// selected products of cart
  List<ProductModel> selectedProducts = <ProductModel>[];

  /// to add product to card use this function
  void onSelectProduct(ProductModel product) {
    selectedProducts.add(product);
    update();
  }
}
