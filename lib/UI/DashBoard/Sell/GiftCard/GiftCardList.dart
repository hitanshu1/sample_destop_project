
import 'package:flutter/material.dart';

import '../../../../Dialogues/Dialogues.dart';
import '../../../../Models/GiftCard.dart';
import '../../../../Widgets/Views/Views.dart';
import 'Card.dart';

/// Gift card List
class GiftCardList extends StatefulWidget {
  /// GiftCard list
  final List<GiftCard>list;

  /// constructor
  const GiftCardList({super.key,required this.list});

  @override
  State<GiftCardList> createState() => _GiftCardListState();
}

class _GiftCardListState extends State<GiftCardList> {
  /// selected giftCard
  GiftCard? selectedData;

  @override
  Widget build(BuildContext context) {
    return AddEditListContainer(
      title:'GiftCard List',
      header: header(),
      listBody: list(),
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

  /// header of the GiftCard list
  Widget header() {
    return const GiftCardWidget(index: -1);
  }

  /// sell listView builder
  Widget list(){
    return ListView.builder(

        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          final GiftCard data = widget.list[index];
          return GiftCardWidget(
            index: index,
            data: data,
            isSelected: data==selectedData,
            onSelected: () {
              onSelectSell(data);
            },
          );
        });
  }

  void onSelectSell(GiftCard data){
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
