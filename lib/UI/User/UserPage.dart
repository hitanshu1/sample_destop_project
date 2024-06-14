import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';
import '../../Dialogues/Dialogues.dart';
import '../../Models/User.dart';
import '../../Widgets/Widgets.dart';
import 'AddEdit.dart';
import 'UserCard.dart';

/// users Page for picker
class UsersPage extends StatefulWidget {
  ///Function to be executed on selection
  final Function(UserModel)? onSelected;

  /// constructor
  const UsersPage({super.key, this.onSelected});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String query = '';
  int offset = 0;
  List<UserModel>? results;

  ///To perform Update, Delete
  UserModel? selectedData;
  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        header(),
        searchCard(),
        const UserCard(index: -1),
        Expanded(child: resultsView()),
        confirmButton(),
      ],
    );
  }

  Widget header() {
    return Container(
      decoration: const BoxDecoration(
        color: Colorz.blue,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Txt(
              AppStrings.users,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          addButton(),
          if (selectedData != null) editButton(),
          if (selectedData != null) deleteButton(),
        ],
      ),
    );
  }

  Widget searchCard() {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: TxtField(
        hintColor: Colors.grey.withOpacity(0.8),
        textColor: Colors.grey,
        autofocus: true,
        showHeader: false,
        labelAsHeader: false,
        showLabel: false,
        contentPadding: const EdgeInsets.only(bottom: 16),
        text: query,
        hintText: 'Search by user name...',
        onChanged: (String z) {
          setState(() => query = z);
          Widgets.bouncer(get);
        },
        onSubmitted: get,
      ),
    );
  }

  Widget addButton() {
    return CrudCover.mcButton(
      toEdit: false,
      child: Iconbutton(
        icon: Icons.add,
        color: Colors.white,
        tooltip: 'Add',
        onPressed: _showAddEditDialogue,
      ),
    );
  }

  Widget editButton() {
    return CrudCover.mcButton(
      toEdit: true,
      child: Iconbutton(
        icon: Icons.edit,
        color: Colors.white,
        tooltip: 'Edit',
        onPressed: () {
          if (selectedData == null) {
            Widgets.showToast('Select a user to edit!');
          } else {
            _showAddEditDialogue(selectedData);
          }
        },
      ),
    );
  }

  Widget deleteButton() {
    return CrudCover.mcButton(
      toEdit: true,
      crud: Crud.delete,
      child: Iconbutton(
        icon: Icons.delete,
        color: Colors.white,
        tooltip: 'Delete',
        onPressed: () async {
          if (selectedData == null) {
            Widgets.showToast('Select a user to delete!');
          } else {
            // final bool deleted = await DrugsRepo.delete(selectedData!);
            // if (deleted) {
            //   setState(() => results!.remove(selectedData!));
            // }
          }
        },
      ),
    );
  }

  void _showAddEditDialogue(UserModel? user) {
    Dialogues.show(
      context,
      title: user == null ? 'Add User' : 'Edit User',
      dialoguer: false,
      barrierDismissible: false,
      child: AddEditUserPage(
          old: user,
          onCompleted: (UserModel newData) {
            if (user == null) {
              if (mounted) {
                setState(() => results!.add(newData));
              }
            } else {
              setState(() {
                final int index = results!.indexOf(selectedData!);
                selectedData = newData;
                results![index] = newData;
              });
            }
          }),
    );
  }

  Widget resultsView() {
    if (results == null) {
      return Widgets.loader();
    }
    if (results!.isEmpty) {
      return Widgets.empty();
    }
    return listView();
  }

  Widget listView() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: results!.length,
        itemBuilder: (BuildContext context, int index) {
          final UserModel user = results![index];
          final bool isSelected = user.id == selectedData?.id;
          return UserCard(
            isSelected: isSelected,
            index: index,
            data: user,
            onSelected: () {
              if (mounted) {
                setState(
                    () => selectedData = isSelected ? null : results![index]);
              }
            },
          );
        });
  }

  Widget confirmButton() {
    return CrossFade(
      show: selectedData != null && widget.onSelected != null,
      child: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(8.0),
        child: Button(
          icon: Icons.check,
          text: 'Confirm Selection',
          buttonColor: Colorz.primary,
          isBig: true,
          isVoid: true,
          onPressed: () {
            widget.onSelected!(selectedData!);
          },
        ),
      ),
    );
  }

  Future<void> get() async {
    if (mounted) {
      setState(() => results = null);
    }
    await Widgets.wait();
    results = <UserModel>[
      UserModel(name: 'abce',id: '1'),
      UserModel(name: 'bcd',id: '2'),
    ];
    // results = await UserRepo.get(
    //   offset: offset,
    //   limitPerResult: limitPerResult,
    //   query: query,
    // );
    if (mounted) {
      setState(() {});
    }
  }

  /// Function is to add Drug
  Future<void> addFn(UserModel? val) async {
    if (val != null) {
      setState(() => results!.add(val));
    }
  }

  /// Function is to update Drug
  Future<void> updateFn(UserModel? val) async {
    if (val != null) {
      final int index = results!.indexOf(selectedData!);
      selectedData = val;
      if (mounted) {
        setState(() => results![index] = val);
      }
    }
  }

  /// Function is to delete Drug
  void deleteFn(UserModel? val) {
    if (val != null) {
      Dialogues.delete(context, deleteFn: () async {
        // final bool isDeleted = await UsersRepo.delete(selectedData!);
        // if (isDeleted) {
        //   if (mounted) {
        //     setState(() => results!.remove(val));
        //   }
        // }
      });
    } else {
      Widgets.showToast('Please select drug');
    }
  }
}
