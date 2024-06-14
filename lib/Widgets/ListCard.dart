part of './Widgets.dart';

///A Card widget used in [ListView] to show Zig zag colors based on index
class ListCard extends StatelessWidget {
  ///Index of the card
  final int index;

  ///If the card is currently selected or not
  final bool isSelected;

  ///If the card is a table head
  ///List of labels to be shown inside the card
  final List<Label> labels;

  ///Function to be executed on selection
  final VoidCallback? onSelected;

  ///To show or hide the card
  final bool show;

  ///Width to be applied in common.
  final double commonWidth;

  ///Height of the card
  final double height;

  ///Color of the vertical divider
  final Color? dividerColor;

  ///Color to be shown for the Even Row
  final Color? evenColor;

  ///Table header color
  final Color? tableHeaderColor;

  ///Size of the font
  final double? fontSize;

  ///Function to be executed on double tap
  final VoidCallback? onDoubleTap;

  ///Custom color of the card
  final Color? cardColor;

  ///Constructor
  const ListCard({
    super.key,
    required this.index,
    this.isSelected = false,
    this.onSelected,
    this.show = true,
    this.commonWidth = 150,
    this.height = 35.75,
    required this.labels,
    this.dividerColor,
    this.evenColor,
    this.tableHeaderColor,
    this.fontSize,
    this.onDoubleTap,
    this.cardColor,
  });
  @override
  Widget build(BuildContext context) {
    bool show = true;
    if (isTableHeader == false) {
      show = show;
    }
    Color color = Colorz.dark;
    if (index.isEven) {
      color = Colorz.canvasColor;
    } else {
      color = Colors.grey.withOpacity(0.25);
    }

    if (isSelected) {
      color = Colorz.primary;
    }

    if (isTableHeader) {
      color = tableHeaderColor ?? Colorz.dark;
    }
    if (cardColor != null) {
      color = cardColor!;
    }

    return CrossFade(
        show: show,
        useCenter: false,
        padding: EdgeInsets.zero,
        duration: Widgets.duration,
        child: GestureDetector(
          onTap: onSelected,
          onDoubleTap: onDoubleTap,
          child: Container(
            height: height,
            color: color,
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: labels.map((Label label) => labelBox(label, color)).toList(),
            ),
          ),
        ));
  }
  /// common padding 

  static const double paddingValue = 12;

  ///Common box to contain the information
  Widget labelBox(Label label, Color backgroundColor) {
    return Container(
      decoration: BoxDecoration(

          ///No bodrder required for 1st element
          border: labels.first == label
              ? null
              : Border(
                  left: BorderSide(
                    color: isTableHeader ? Colors.white10 : (dividerColor ?? Colors.white70),
                    width: 1.5,
                  ),
                )),
      padding: const EdgeInsets.symmetric(horizontal: paddingValue),
      child: Container(
          alignment: Alignment.center,
          height: 25,
          width: label.width ?? commonWidth,
          child: label.content is Widget
              ? label.content
              : Txt(
                  (isTableHeader ? label.title : label.content)?.toString() ?? '-',
                  maxlines: 1,
                  fontSize: fontSize,
                  textAlign: TextAlign.center,
                  color: backgroundColor.opacity < 1 ? null : backgroundColor.readable,
                  fontWeight: isTableHeader ? FontWeight.bold : FontWeight.normal,
                )),
    );
  }
  /// check Table header or not

  bool get isTableHeader => index <= -1;
}
