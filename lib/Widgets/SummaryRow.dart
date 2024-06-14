
part of './Widgets.dart';

/// cart summary row
class SummaryRow extends StatelessWidget {
  /// label text
  final String label;
  /// value of the
  final String value;
  /// text fontWeight
  final bool isBold;
/// constructor
  const SummaryRow({super.key, required this.label, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Cardd(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Txt(label,fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          Txt(value,fontWeight: isBold ? FontWeight.bold : FontWeight.normal,toCurrency: true, ),
        ],
      ),
    );
  }
}
