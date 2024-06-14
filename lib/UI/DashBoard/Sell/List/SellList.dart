import 'package:flutter/material.dart';
import '../../../../Dialogues/Dialogues.dart';
import '../../../../Models/sell.dart';
import '../../../../Widgets/Views/Views.dart';
import '../../../../Widgets/Widgets.dart';
import 'Card.dart';

/// sell list of the store
class SellList extends StatefulWidget {
  /// sell list
  final List<SellModel>sells;
  /// sell list title
  final String? title;
  /// list scrollable enable/disable
  final bool isScrollable;
  /// constructor
  const SellList({super.key,required this.sells,this.title,this.isScrollable=true});

  @override
  State<SellList> createState() => _SellListState();
}

class _SellListState extends State<SellList> {


  /// selected sell
  SellModel? selectedData;
  @override
  Widget build(BuildContext context) {
    return AddEditListContainer(
      title: widget.title,
      header: header(),
      listBody: list(),
      isScrollable: widget.isScrollable,
      showAddEdit: selectedData!=null,
      onPressedRefresh: (){

      },
      onPressedAdd: (){

      },
      onPressedEdit: (){

      },
      onPressedDelete: onDeleted,
    );
  }

  /// header of the sell list
  Widget header() {
    return const SellCard(index: -1);
  }

  /// sell listView builder
  Widget list(){
    if(widget.sells.isEmpty){
      return Widgets.notFoundWidget();
    }
    return ListView.builder(
        physics: widget.isScrollable?const BouncingScrollPhysics():const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: widget.sells.length,
        itemBuilder: (BuildContext context, int index) {
          final SellModel data = widget.sells[index];
          return SellCard(
            index: index,
            data: data,
            isSelected: data==selectedData,
            onSelected: () {
              onSelectSell(data);
            },
          );
        });
  }

  void onSelectSell(SellModel data){
    if(selectedData==data){
      selectedData=null;
    }else{
      selectedData=data;
    }
    setState(() {

    });

  }
  void onDeleted(){
    Dialogues.delete(context, deleteFn: () async {

    });
  }
}
