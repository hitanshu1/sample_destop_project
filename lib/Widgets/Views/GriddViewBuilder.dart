part of 'Views.dart';
/// common grid view builder
class GriddViewBuilder extends StatelessWidget {
  /// total items and croos axis items
  final int ? itemCount,crossAxisCount;
  /// item builder 
 final Widget? Function( int index) item;
 /// constructor
  const GriddViewBuilder({super.key,this.itemCount,this.crossAxisCount,required this.item});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount??0,
      gridDelegate:
           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount??3),
      itemBuilder: (BuildContext context, int index) {
        return item(index);
      },
    );
  }
}
