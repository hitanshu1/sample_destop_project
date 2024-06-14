
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/sizeConfig.dart';
import '../../../Models/Widgets/TCS.dart';
import '../../../Widgets/Widgets.dart';
/// dashboard big card widget
class DashBoardCard extends StatelessWidget {
  /// title count subtitle model
  final TCS tcs;
  ///constructor
  const DashBoardCard({super.key,
    required this.tcs});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: tcs.color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Widgets.heading(text:tcs.title ,fontSize: 16,
            color: Colorz.white),
            SizeConfig.verticalSpaceSmall(),
            Widgets.heading(text:tcs.count ,fontSize: 24,
                color: Colorz.white),
            SizeConfig.verticalSpaceSmall(),
            Txt(tcs.subtitle,
            color: Colorz.white,),

            SizeConfig.verticalSpaceSmall(),
            TxtButton(
              text: 'Details',
              onPressed: () {},
            ),

          ],
        ),
      ),
    );
  }
}
