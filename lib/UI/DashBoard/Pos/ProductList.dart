import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/posPageController.dart';
import '../../../Widgets/Tiles/ProductTile.dart';
import '../../../Widgets/Views/Views.dart';

/// all products list

class ProductList extends StatelessWidget {
  /// constructor
  ProductList({super.key});

  /// posPage controller use to manage state of page
  final PosPageController pageController = Get.put(PosPageController());

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      child: Column(
        children: <Widget>[
          searchWidget(),
           productList(),
        ],
      ),
    );
  }

  /// product search textFiled
  Widget searchWidget() {
    return SearchBar(
      controller: pageController.searchTextController,
      hintText: 'Search/Barcode Scan',
      onChanged: (String val) {
        pageController.update();
      },
    );
  }

  /// search product list
  Widget productList() {
    return Expanded(
        child: GriddViewBuilder(
          crossAxisCount: 5,
            itemCount: pageController.searchProducts.length,
            item: (int index) {
              return ProductTile(
                product: pageController.searchProducts[index],
                onTap: () {
                  pageController
                      .onSelectProduct(pageController.searchProducts[index]);
                },
              );
            }));
  }
}
