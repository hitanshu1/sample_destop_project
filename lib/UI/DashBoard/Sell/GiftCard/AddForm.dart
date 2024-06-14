import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Constants/sizeConfig.dart';
import '../../../../Controllers/GiftCardController.dart';
import '../../../../Dialogues/Dialogues.dart';
import '../../../../Models/User.dart';
import '../../../../Widgets/Widgets.dart';
import '../../../User/UserPage.dart';

/// add GiftCard form
class AddFormGiftCard extends StatefulWidget {
  ///constructor
  const AddFormGiftCard({super.key});

  @override
  State<AddFormGiftCard> createState() => _AddFormGiftCardState();
}

class _AddFormGiftCardState extends State<AddFormGiftCard> {
  /// values of textFields
  String? cardNumber, giftCardValue, balance;
  int? expiryDate;
  UserModel? customer;

  /// page controller to control page state
  GiftCardController pageController = Get.put(GiftCardController());

  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      children: <Widget>[
        TxtField(
            text: cardNumber,
            hintText: AppStrings.cardNo,
            onChanged: (String val) {}),
        TxtField(
            text: giftCardValue,
            hintText: AppStrings.giftCardValue,
            onChanged: (String val) {}),
        TxtField(
            text: balance,
            hintText: AppStrings.balance,
            onChanged: (String val) {}),
        pickCustomer(),
        expiryDatePicker(),
        bottomButtons(),
      ].map((Widget e) {
        return Column(
          children: <Widget>[
            e,
            SizeConfig.verticalSpaceSmall(),
          ],
        );
      }).toList(),
    );
  }

  Widget expiryDatePicker() {
    return DatePickerTextField(
        text: expiryDate,
        hintText: AppStrings.expiryDate,
        onChanged: (DateTime val) {
          expiryDate = val.millisecondsSinceEpoch;
          setState(() {});
        });
  }

  Widget pickCustomer() {
    return Inkk(
      onTap: () {
         Dialogues.select(
          context,
          width: 1200,
          height: 720,
          title: 'Select a User',
          barrierDismissible: false,
          child: const UsersPage(),
        );
      
      },
      child: TxtField(
          text: customer?.name,
          hintText: AppStrings.customer,
          onChanged: (String val) {}),
    );
  }

  Widget bottomButtons() {
    return Row(
      children: <Widget>[
        Button(
          text: AppStrings.createGiftCard,
        ),
        SizeConfig.horizontalSpace(),
        Button(
          onPressed: onReset,
          buttonColor: Colorz.red,
          text: AppStrings.reset,
        )
      ],
    );
  }

  void onReset() {
    cardNumber = null;
    customer = null;
    giftCardValue = null;
    balance = null;
    expiryDate = null;
    setState(() {});
  }
}
