part of 'Widgets.dart';

/// A custom text field widget that provides various customization options.
class TxtField extends StatefulWidget {
  /// The initial text to be displayed in the text field.
  final dynamic text;

  /// The minimum length required for the text to be considered valid.
  final int validLength;

  /// Indicates whether the text field's content is valid or not.
  final bool? valid;

  /// The hint text to be displayed when the text field is empty.
  final String hintText;

  /// The color of the hint text.
  final Color? hintColor;

  /// The maximum number of lines allowed in the text field.
  final int maxLines;

  /// The maximum length allowed for the input in the text field.
  final int? maxLength;

  /// Callback function when the text in the text field changes.
  final Function(String string) onChanged;

  /// Callback function when the user submits the text field.
  final VoidCallback? onSubmitted;

  /// Determines if the text field is enabled or disabled for input.
  final bool enabled;

  /// Determines whether to use a validation icon (checkmark) in the text field.
  final bool useValidationIcon;

  /// The type of keyboard to be displayed when the text field is focused.
  final TextInputType? keyboardType;

  /// The capitalization behavior for the text field.
  final TextCapitalization textCapitalization;

  /// The focus node for controlling the focus behavior of the text field.
  final FocusNode? focusNode;

  /// Callback function when the text field is cleared.
  final VoidCallback? onCleared;

  /// The leading widget to be displayed as the prefix of the text field.
  final Object? leading;

  /// Determines if the text field should be autofocus on first display.
  final bool autofocus;

  /// The background color of the text field card.
  final Color? cardColor;

  ///Elevation of the card if enabled.
  final double elevation;

  /// Determines if the hint text should be treated as a label.
  final bool showLabel;

  /// The action to be displayed in the text field's action button (e.g., done, next).
  final TextInputAction? textInputAction;

  /// Determines whether the copy and paste feature is enabled in the text field.
  final bool allowCopyPaste;

  ///If to allow String only or not
  final bool stringOnly;

  /// The input formatter for modifying the text input in the text field.
  final TextInputFormatter? formatter;

  /// The text color for the content of the text field.
  final Color? textColor;

  /// The padding for the content of the text field.
  final EdgeInsets? contentPadding;

  ///To hide the text Eg: Password
  final bool hideText;

  ///Parent height of the textfield
  final double? height;

  ///Width of the Text box. If specified then a container will be placed.
  final double? width;

  ///To create as a currency value ie with decimal precision
  final bool currency;

  ///To use a card widget above the texfield
  final bool enableCard;

  ///To show the label above the entire widget
  final bool labelAsHeader;

  ///To allow to type only in lowercase
  final bool toLowercase;

  /// to remove top  Padding
  final bool removeTopPadding;

  /// to remove extra Padding
  final bool removeExtraPadding;

  /// To remove header text above text field
  final bool showHeader;

  ///Style of the text
  final TextStyle? style;

  ///Alignment of the text inside the field
  final TextAlign? textAlign;

  /// the textField background color
  final Color? fieldBackgroundColor;

/// textFiled lebel text
  final String? labelText;
  /// enable disable date Icon
  final bool enableDateIcon;
  
  /// enable/disable pending Long line

  final bool extraPaddingForMoreLines;
/// enable disable text horizontal title
  final bool horizontalTitle;
/// title width
  final double? titleWidth;

  /// [margin]
  final EdgeInsets? margin;

  /// /// Constructor
  const TxtField({
    super.key,
    this.enableCard = false,
    this.extraPaddingForMoreLines = false,
    required this.text,
    this.formatter,
    this.allowCopyPaste = true,
    this.textInputAction,
    this.autofocus = false,
    this.removeExtraPadding = false,
    this.removeTopPadding = false,
    this.horizontalTitle = false,
    this.onCleared,
    this.leading,
    this.focusNode,
    this.keyboardType,
    this.enabled = true,
    required this.hintText,
    this.style,
    required this.onChanged,
    this.validLength = 1,
    this.valid,
    this.maxLines = 1,
    this.maxLength,
    this.onSubmitted,
    this.useValidationIcon = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.cardColor,
    this.showLabel = true,
    this.hintColor = Colors.grey,
    this.textColor,
    this.contentPadding,
    this.hideText = false,
    this.width,
    this.currency = false,
    this.elevation = 0,
    this.labelAsHeader = true,
    this.stringOnly = false,
    this.toLowercase = false,
    this.showHeader = true,
    this.height,
    this.textAlign,
    this.fieldBackgroundColor,
    this.labelText,
    this.enableDateIcon = false,
    this.margin,
    this.titleWidth
  });

  /// Custom field for [double] values.
  factory TxtField.getDouble(
      {required dynamic text,
      bool? isValid,
      Object? leading,
      EdgeInsets? margin,
      final bool hitanshuNeedExtraPaddingForMoreLines = false,

      /// to remove top  Padding
      final bool removeTopPadding = false,

      /// to remove extra Padding
      final bool removeExtraPadding = false,
      required String hintText,
      required Function(double) onChanged,
      bool useValidationIcon = false,
      Key? key,
      int? maxLength,
      int ?maxLines,
      bool showLabel = true,
      bool enabled = true,
      double? width,
      Color? cardColor,
      bool currency = false,
      EdgeInsets? contentPadding,
      bool labelAsHeader = true,
      bool showHeader = true,
      double?titleWidth,
      bool horizontalTitle = false}) {
    final String currencySymbol = Widgets.currencySymbol;
    final int decimalPlace = Widgets.decimalPlace;

    return TxtField(
      margin: margin,
      maxLines: maxLines ?? 1,
      extraPaddingForMoreLines:
          hitanshuNeedExtraPaddingForMoreLines,
      removeTopPadding: removeTopPadding,
      removeExtraPadding: removeExtraPadding,
      showHeader: showHeader,
      labelAsHeader: labelAsHeader,
      contentPadding: contentPadding,
      currency: currency,
      cardColor: cardColor,
      width: width,
      enabled: enabled,
      showLabel: showLabel,
      leading: leading,
      maxLength: maxLength,
      key: key,
      valid: isValid,
      horizontalTitle: horizontalTitle,
      text: text,
      titleWidth:titleWidth,
      hintText: currency ? '($currencySymbol) $hintText' : hintText,
      useValidationIcon: useValidationIcon,
      formatter: FilteringTextInputFormatter.allow(RegExp(
          currency ? r'^\d*\.?\d{0,' '$decimalPlace' '}' : r'^\d*\.?\d*')),
      onChanged: (String s) {
        final double? d = double.tryParse(s);
        if (d != null) {
          final double rawValue = d >= 0 ? d : 0;
          onChanged(rawValue.toFixedDigit);
        }
      },
    );
  }

  /// Custom field for [int] values.
  factory TxtField.getInt(
      {EdgeInsets? contentPadding,
      EdgeInsets? margin,
      final bool hitanshuNeedExtraPaddingForMoreLines = false,

      /// to remove top  Padding
      final bool removeTopPadding = false,

      /// to remove extra Padding
      final bool removeExtraPadding = false,
      final Color? fieldBackgroundColor,
      required dynamic text,
      Object? leading,
      bool? isValid,
      int? maxLength,
      int ?maxLines,
      required String hintText,
      required Function(int) onChanged,
      bool useValidationIcon = false,
      Key? key,
      bool showLabel = true,
      bool enabled = true,
      Color? cardColor,
      double? width,
      RegExp? regExp,
      bool showHeader = true,
      double ?titleWidth,
      bool horizontalTitle = false}) {
    return TxtField(
      showHeader: showHeader,
      contentPadding: contentPadding,
      extraPaddingForMoreLines:
          hitanshuNeedExtraPaddingForMoreLines,
      leading: leading,
      fieldBackgroundColor: fieldBackgroundColor,
      width: width,
      cardColor: cardColor,
      enabled: enabled,
      removeTopPadding: removeTopPadding,
      removeExtraPadding: removeExtraPadding,
      showLabel: showLabel,
      key: key,
      margin: margin,
      text: text,
      valid: isValid,
      maxLines: maxLines ?? 1,
      hintText: hintText,
      maxLength: maxLength,
      useValidationIcon: useValidationIcon,
      horizontalTitle: horizontalTitle,
      titleWidth:titleWidth,
      formatter: FilteringTextInputFormatter.allow(regExp ?? RegExp('[0-9]')),
      onChanged: (String s) {
        final int? i = int.tryParse(s);
        if (i != null) {
          onChanged(i >= 0 ? i : 0);
        }
      },
    );
  }

  @override
  _TextfieldState createState() => _TextfieldState();
}

class _TextfieldState extends State<TxtField> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    String text = widget.text == null ? '' : widget.text.toString();
    if (widget.text is double && widget.currency) {
      text = (widget.text as double).toFixedDigitString;
    }

    _textEditingController = TextEditingController(text: text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget container = Container(
      height: widget.height ?? (widget.maxLines == 1 ? 35 : null),
      width: widget.width,
      padding: widget.margin ?? const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        obscureText: widget.hideText,
        enableInteractiveSelection: widget.allowCopyPaste,
        textInputAction: widget.textInputAction,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        controller: _textEditingController,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onSubmitted: onSubmitted,
        decoration: decoration(),
        // cursorHeight: 10,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        style: widget.style ?? TextStyle(color: widget.textColor),
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign ?? TextAlign.start,
        textCapitalization: widget.textCapitalization,
        inputFormatters: <TextInputFormatter>[
          if (widget.formatter != null) widget.formatter!,
          if (widget.stringOnly)
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s.]+$')),
          if (widget.toLowercase) LowerCaseTextFormatter(),
          if (widget.maxLength != null)
            LengthLimitingTextInputFormatter(widget.maxLength),
        ],
      ),
    );
    Widget cardedWidget;
    if (widget.enableCard) {
      cardedWidget = Card(
        elevation: widget.elevation,
        color: widget.cardColor,
        child: container,
      );
    } else {
      cardedWidget = container;
    }
    if (widget.horizontalTitle) {
      return Row(
        children: <Widget>[
          SizedBox(
            width: widget.titleWidth,
            child: Txt(
              widget.labelText ?? widget.hintText,
              maxlines: 1,
            ),
          ),
          SizeConfig.horizontalSpace(),
          if (widget.width != null) cardedWidget else Expanded(child: cardedWidget),
        ],
      );
    }
    return (widget.labelAsHeader && widget.removeExtraPadding == false)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (widget.showHeader)
                Padding(
                  padding: EdgeInsets.only(
                      left: 12.0,
                      top: widget.removeTopPadding ? 0 : 4,
                      bottom: 4),
                  child: Txt(
                    widget.labelText ?? widget.hintText,
                    maxlines: 1,
                  ),
                ),
              cardedWidget,
            ],
          )
        : cardedWidget;
  }

  bool get showLabel {
    if (widget.showLabel) {
      return true;
    } else {
      return widget.hintText.contains('*');
    }
  }

  InputDecoration decoration() {
    final Color color = widget.hintColor ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade800
            : Colors.white70);
    final TextStyle style = TextStyle(
      color: color,
      fontSize: 12.5,
      fontWeight: FontWeight.normal,
    );
    return InputDecoration(
      labelText:
          (widget.labelAsHeader || showLabel == false) ? null : widget.hintText,
      labelStyle: style,
      hintText: widget.hintText,
      hintStyle: style,
      fillColor: widget.fieldBackgroundColor,
      counterText: '',
      prefixIcon: prefixIcon(),
      suffixIcon: suffixIcon(),
      border: widget.labelAsHeader
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )
          : InputBorder.none,
      contentPadding: _contentPadding,
    );
  }

  EdgeInsets get _contentPadding {
    if (widget.extraPaddingForMoreLines) {
      return widget.contentPadding ??
          EdgeInsets.only(
              left: widget.labelAsHeader ? 8 : 0,
              top: widget.maxLines > 1 ? 15 : 0);
    }
    return widget.contentPadding ??
        EdgeInsets.only(
          left: widget.labelAsHeader ? 8 : 0,
        );
  }

  Widget? prefixIcon() {
    if (widget.leading is String) {
      return textIcon(widget.leading! as String);
    }
    if (widget.leading is Widget) {
      return widget.leading! as Widget;
    }
    if (widget.leading is IconData) {
      return Icon(widget.leading! as IconData, color: Colors.grey);
    }
    return null;
  }

  Widget textIcon(String text) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      child: Txt(
        text,
        color: Colors.grey.shade700,
        fontSize: 16,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget? suffixIcon() {
    if (widget.onCleared != null) {
      return clearButton();
    }
    if (widget.useValidationIcon) {
      return validButton();
    }
    if (widget.enableDateIcon) {
      return _dateIcon();
    }
    return null;
  }

  Widget _dateIcon() {
    return const Icon(
      Icons.date_range,
      color: Colors.black,
    );
  }

  Widget clearButton() {
    return IconButton(
      icon: const Icon(Icons.clear, color: Colors.grey),
      tooltip: 'Delete',
      onPressed: () {
        _textEditingController.clear();
        widget.onChanged(_textEditingController.text);
        widget.onCleared!();
      },
    );
  }

  Widget validButton() {
    final bool valid0 = _textEditingController.text.replaceAll(' ', '').length >
        widget.validLength;
    final bool valid = widget.valid ?? valid0;
    return Icon(Icons.check_circle, color: valid ? Colors.green : Colors.grey);
  }

  int get lnth => _textEditingController.text.length;

  void onSubmitted(String z) {
    if (widget.onSubmitted != null) {
      widget.onSubmitted!();
    } else {
      ///Do nothing
      // FocusScope.of(context).nextFocus();
    }
  }
}
/// text lowerCase formatter

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
