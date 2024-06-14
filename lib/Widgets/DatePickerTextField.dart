part of 'Widgets.dart';
/// app DatePicker
class DatePickerTextField extends StatelessWidget {
  /// The initial text to be displayed in the text field.
  final dynamic text;
  /// The hint text to be displayed when the text field is empty.
  final String hintText;
  /// Callback function when the text in the text field changes.
  final Function(DateTime val) onChanged;
  /// constructor
  const DatePickerTextField({super.key,this.text,required this.hintText,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Inkk(
      onTap: () async {
        FocusScope.of(context).unfocus();
        final DateTime? dt = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365 * 50)),
          lastDate: DateTime(2050),
        );
        if (dt != null) {
          onChanged(dt);
        }
      },
      child: TxtField(
          key: Key('$text'),
          removeTopPadding: true,
          text: text == null ? '' : Widgets.toDate(text!),
          stringOnly: true,

          hintText: hintText,
          onChanged: (String val){
          }),
    );
  }
}
