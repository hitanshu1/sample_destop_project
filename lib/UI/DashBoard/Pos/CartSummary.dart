import 'package:flutter/material.dart';
import '../../../Constants/sizeConfig.dart';
import '../../../Widgets/Views/Views.dart';
import '../../../Widgets/Widgets.dart';

/// cart summary
class CartSummary extends StatelessWidget {
  /// constructor
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      isHilight: true,
      child: Column(
        children: <Widget>[
          totalRow(),
          discountTaxRow(),
          shippingAndOtherRow(),
          summeryRow(),
        ].map((Widget e) {
          return Column(children: <Widget>[e,SizeConfig.verticalSpace()]);
        }).toList(),
      ),
    );
  }

  /// total price row
  Widget totalRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Txt('Total Item'),
        Txt('1 (1)'),
        Txt('Total'),
        Txt('100.00',toCurrency: true,),
      ],
    );
  }

  /// discount and tax textFields
  Widget discountTaxRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        textFieldRow(
          title: 'Discount',
        ),
        textFieldRow(
          title: 'Tax Amount (%)',
        ),
      ],
    );
  }
/// shipping and other charge textFields
  Widget shippingAndOtherRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        textFieldRow(
          title: 'Shipping Charge',
        ),
        textFieldRow(
          title: 'Other Charge',
        ),
      ],
    );
  }

  /// total summery  Widget
  Widget summeryRow() {
    return const SummaryRow(label: 'Total Payable', value: '100.00', isBold: true);
  }

  /// common textField
  Widget textFieldRow({String? title}) {
    return Expanded(
      child: TxtField(
        width: 100,
        titleWidth: 100,
        horizontalTitle: true,
        text: '',
        labelText: title,
        hintText: '',
        onChanged: (String val) {},
      ),
    );
  }
}
