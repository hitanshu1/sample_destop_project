part of './Widgets.dart';
/// common scroll widget
class Scroller extends StatelessWidget {
  /// scroll controller
  final ScrollController scrollController;
  /// child of scroll widget
  final Widget? child;
  /// enable/disable scroll indicator
  final bool useScrollIndicator;
  /// constructor
  const Scroller(
      {super.key,
      required this.scrollController,
      required this.child,
      this.useScrollIndicator = false});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:  scrollController.position.pixels < 10,
      onPopInvoked: (bool val){
        scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.ease);
      },
      child: useScrollIndicator ? indicator() : childWidget(),
    );
  }

  /// scroll indicator

  Widget indicator() {
    return Scrollbar(
      thickness: 10,
      child: childWidget(),
    );
  }
/// body child of scroll widget
  Widget childWidget() {
    return child ?? const Center(child: Icon(Icons.sentiment_dissatisfied));
  }

}
