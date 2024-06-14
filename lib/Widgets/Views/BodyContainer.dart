part of 'Views.dart';

/// common body container widget
class BodyContainer extends StatelessWidget {
  /// child of the container
  final Widget? child;
  /// enable/disable hilight
  final bool isHilight;
/// constructor
  const BodyContainer({super.key, this.child,this.isHilight=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isHilight?Colors.grey[200]:Colors.white,
      padding: EdgeInsets.all(SizeConfig.spaceBetween),
      child: child,
    );
  }
}
