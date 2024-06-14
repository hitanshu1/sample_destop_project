
import 'package:flutter/material.dart';

import '../../Models/User.dart';

/// add/Edit user page
class AddEditUserPage extends StatelessWidget {
  /// edit user data
  final UserModel ?old;

  /// on completed add/edit
  final Function(UserModel user)onCompleted;
  /// constructor
  const AddEditUserPage({super.key,this.old,required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}
