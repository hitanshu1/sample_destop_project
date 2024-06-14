
part of './Views.dart';
/// List table container with add Edit button
class AddEditListContainer extends StatelessWidget {
  /// list title
  final String ?title;
  /// title color
  final Color ?textColor;
  /// list header
  final Widget ?header;
  /// body containing list view
  final Widget? listBody;
  /// show add/edit button enable/disable option
  final bool showAddEdit;
  /// add,edit clear and refresh Funtions
  final VoidCallback? onPressedAdd, onPressedEdit, onPressedDelete,onPressedRefresh;
  /// list scrollable enable/disable
  final bool isScrollable;

  /// constructor
  const AddEditListContainer({super.key,this.title,this.listBody,this.showAddEdit=false,
  this.onPressedAdd,this.onPressedDelete,this.onPressedEdit,this.onPressedRefresh,this.textColor,this.header,this.isScrollable=true});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      padding:EdgeInsets.all(SizeConfig.spaceBetween),
      decoration: BoxDecoration(

          borderRadius:
              BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.spaceBetween),
                  topRight: Radius.circular(SizeConfig.spaceBetween))),
      child:  Column(
        children: <Widget>[

          Row(
            children: <Widget>[
              Expanded(
                  child: Txt(
                    title ?? '',
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.largeFont,
                  )),
              actionButtons()
            ],
          ),
          header??Container(),
          listBodyWidget()
        ],
      ),
    );
  }
  /// listView widget
  Widget listBodyWidget(){
    if(isScrollable){
      return Expanded(child: listBody??Container());
    }
    return listBody??Container();
  }
  /// add edit clear and refresh buttons
  Widget actionButtons(){
    return Row(
      children: <Widget>[
        if (onPressedRefresh != null)
          Iconbutton(
            onPressed: () async {
              await Widgets.wait();
              onPressedRefresh!();
              Widgets.showToast('Refreshed!');
            },
            icon: Icons.refresh,
            color: Colors.black87,
            tooltip: 'Refresh',
          ),
        if (onPressedAdd != null&&showAddEdit)
          Iconbutton(
            icon: Icons.add,
            color: Colors.black87,
            tooltip: 'Add',
            onPressed: onPressedAdd,
          ),
        if (onPressedEdit != null&&showAddEdit)
          Iconbutton(
            icon: Icons.edit_outlined,
            color: Colors.black87,
            tooltip: 'Edit',
            onPressed: onPressedEdit,
          ),
        if (onPressedDelete != null&&showAddEdit)
          Iconbutton(
            onPressed: onPressedDelete,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.black87,
            ),
            tooltip: 'Delete',
          ),
      ],
    );
  }
}
