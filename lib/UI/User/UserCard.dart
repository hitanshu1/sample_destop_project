
import 'package:flutter/material.dart';

import '../../Models/User.dart';
import '../../Models/Widgets/Label.dart';
import '../../Widgets/Widgets.dart';
/// user List Card
class UserCard extends StatelessWidget {
  /// list index
  final int index;
  /// userData
  final UserModel? data;
  /// onSelected Function
  final VoidCallback? onSelected;
  /// is user selected
  final bool isSelected;
  ///Constructor
  const UserCard({super.key,this.onSelected,required this.index,this.isSelected=false,this.data});

  @override
  Widget build(BuildContext context) {
    return ListCard(
        index: index,
        onSelected: onSelected,
        isSelected: isSelected,
        labels: <Label>[
        Label('Name', data?.name, width: 200),
    ],
    );
  }
}
