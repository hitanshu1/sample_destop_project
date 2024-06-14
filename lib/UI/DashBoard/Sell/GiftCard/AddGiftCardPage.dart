

import 'package:flutter/material.dart';

import '../../../../Constants/sizeConfig.dart';
import 'AddForm.dart';

/// Add Gift card Page
class AddGiftCardPage extends StatelessWidget {
  /// constructor
  const AddGiftCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(SizeConfig.spaceBetween),
      child: ListView(
        children:const <Widget> [
          AddFormGiftCard()
        ],
      ),
    );
  }
}
