import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Constants.dart';
import '../../../Constants/sizeConfig.dart';
import '../../../Controllers/posPageController.dart';
import '../../../Widgets/Widgets.dart';
import 'CartItem.dart';
import 'CartSummary.dart';

/// cart customer info, product and summary details
class CartDetails extends StatelessWidget {
  /// constructor
   CartDetails({super.key});

   /// page controller to state management
   final PosPageController controller=Get.put(PosPageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          customerDetails(),
          Widgets.divider(),
          selectedProductList(),
          Widgets.divider(),
          const CartSummary(),
          SizeConfig.verticalSpaceMedium(),
          bottomButton(),
        ],
      ),
    );
  }



  /// selected customer name orderID

  Widget customerDetails(){
    return ListTile(
      title: const Text('Walking Customer'),
      subtitle: const Text('017000000000'),
      trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {

      }),
    );
  }


/// customer selected product list

  Widget selectedProductList(){
    return Expanded(
      child: ListView.builder(
          itemCount:controller.selectedProducts.length,
          itemBuilder: (BuildContext context,int index){
            return CartItem(product: controller.selectedProducts[index],);
          }),
    );
  }

  /// bottom payment button

  Widget bottomButton(){
    return Row(
      children: <Widget>[
        Expanded(
          child: Button(
            text: 'PAY NOW',
            onPressed: (){

            },
          ),
        ),
        SizeConfig.horizontalSpace(),
        Expanded(
          child: Button(
            buttonColor: Colorz.red,
            text: 'HOLD',
            onPressed: (){

            },
          ),
        ),
      ],
    );
  }
}
