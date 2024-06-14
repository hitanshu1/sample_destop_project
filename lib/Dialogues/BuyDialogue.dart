import 'package:flutter/material.dart';

import '../Constants/Constants.dart';
import '../Widgets/Widgets.dart';


/// dialogue before user buy
class BuyDialogue extends StatefulWidget {

  /// constructor of BuyDialogue
  const BuyDialogue({super.key});

  @override
  _BuyDialogueState createState() => _BuyDialogueState();
}

class _BuyDialogueState extends State<BuyDialogue> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Material(
          borderRadius: BorderRadius.circular(18),
          color: Colorz.white,
          elevation: 25,
          shadowColor: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.local_shipping, color: Colorz.primary, size: 100),
                ),
                const ListTile(
                  title: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Txt(

                          'Are you sure want to confirm the purchase the product with selected configuration options?',
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Txt(
                       'You can cancel this before shipping.',
                      color: Colors.white70,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons() {
    final List<String> options = <String>[
      'Cancel',
      'Confirm',
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options.map((String option) {
        final bool isConfirmOption = options.indexOf(option) == 1;
        return Button(
          text: option,
          textColor: Colors.white,
          width: MediaQuery.of(context).size.width / 2.75,
          buttonColor: isConfirmOption ? Colorz.primary : Colorz.white,
          processingText: isConfirmOption? 'Confirming...':'Cancelling...',
          onPressed: isConfirmOption ? confirmFn : closeFn,
        );
      }).toList(),
    );
  }

  void closeFn() {
    Navigator.of(context).pop();
  }

  /// on confirm yes
  Future<void> confirmFn() async {
    setState(() => isLoading = true);
  
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    setState(() => isLoading = true);
    Navigator.of(context).pop();
  }
}
