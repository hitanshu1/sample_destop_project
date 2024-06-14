part of './Widgets.dart';

/// app common card widget
class Cardd extends StatelessWidget {
  /// card child
  final Widget? child;
  /// color of card
  final Color? color;
  /// margin of card
  final EdgeInsets? margin;
  /// border side of card
  final BorderSide? side;
  /// card elevation
  final double? elevation;
  /// card border color
  final Color?borderColor;
  /// constructor
  const Cardd({super.key,this.child,this.margin,this.elevation,this.side,this.color,this.borderColor});

  @override
  Widget build(BuildContext context) {
   return Container(
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.borderRadius),
          border: borderColor!=null?Border.all(color: Colorz.green,width: 5):
              const Border()
        ),

        child: Material(
          type: MaterialType.card,

          shadowColor: Colors.black.withOpacity(.5),
          color: color??Theme.of(context).cardColor,
          elevation: elevation??10,
          shape: RoundedRectangleBorder(
              side: side??BorderSide(color: Theme.of(context).cardColor),
              borderRadius: BorderRadius.circular(SizeConfig.borderRadius)
          ),
        

          child: Padding(
            padding: EdgeInsets.all(SizeConfig.spaceBetween),
            child: child,
          ),
        ));
  }
}
