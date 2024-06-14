part of './Dialogues.dart';

///As we need all the params of a [PrintData], just declaring it as [PrintableRichString]
typedef PrintableRichString = PrintData;
/// print color
enum PrintColor {
  ///print color
  grey,
}
/// print widget type
enum PrintWidgetType {
  /// text 
  txt,
  ///printing title
  title,
  /// description
  description,
  /// left right widget
  leftRight,
  /// image 
  img,
  ///
  bullet,
}
/// printing data
class PrintData {
  /// printing text
  final String text;
/// image bytes
  final Uint8List? imgBytes;
  /// fontSize
  final double? fontSize;
  /// enable/disable text bold
  final bool? isBold;
  /// printing widget type
  final PrintWidgetType widgetType;
  /// right
  final Object? right;
  /// rich print string
  final List<PrintableRichString>? richData;
  /// enable/disable underLine
  final bool? isUnderlined;
  /// text color
  final Color? color;
/// line space
  final double? lineSpacing;

  ///Width of the left string in [leftRight]
  final double? leftWidth;
  /// enable bold of right text
  final bool isRightBold;
  
/// constructor
  PrintData(
    this.text, {
    this.right,
    this.widgetType = PrintWidgetType.txt,
    this.imgBytes,
    this.fontSize,
    this.richData,
    this.isBold,
    this.isUnderlined,
    this.color,
    this.lineSpacing,
    this.leftWidth,
    this.isRightBold = true,
  });
///
  factory PrintData.leftRight(String left, Object? right) {
    return PrintData(
      left,
      right: right,
      widgetType: PrintWidgetType.leftRight,
    );
  }
/// copy with print data
  PrintData copyWith({
    String? text,
    Uint8List? imgBytes,
    double? fontSize,
    bool? isBold,
    PrintWidgetType? widgetType,
    Object? right,
    List<PrintableRichString>? richData,
    bool? isUnderlined,
    Color? color,
    double? lineSpacing,
    double? leftWidth,
    bool? isRightBold,
  }) {
    return PrintData(
      text ?? this.text,
      imgBytes: imgBytes ?? this.imgBytes,
      fontSize: fontSize ?? this.fontSize,
      isBold: isBold ?? this.isBold,
      widgetType: widgetType ?? this.widgetType,
      right: right ?? this.right,
      richData: richData ?? this.richData,
      isUnderlined: isUnderlined ?? this.isUnderlined,
      color: color ?? this.color,
      lineSpacing: lineSpacing ?? this.lineSpacing,
      leftWidth: leftWidth ?? this.leftWidth,
      isRightBold: isRightBold ?? this.isRightBold,
    );
  }
}
/// printing page
class PrintingPage extends StatefulWidget {
  /// printing data
  final List<PrintData> data;

  ///To make a table from the above given data
  final bool isTable;
  /// constructor
  const PrintingPage({
    super.key,
    required this.data,
    this.isTable = false,
  });

  @override
  State<PrintingPage> createState() => _PrintingPageState();
}

class _PrintingPageState extends State<PrintingPage> {
  @override
  Widget build(BuildContext context) {
    return printing.PdfPreview(
        canDebug: false,
        build: (_) async {
          final pdf_widgets.Document doc = pdf_widgets.Document();
          doc.addPage(
            pdf_widgets.Page(
              build: (pdf_widgets.Context context) {
                return pdf_widgets.ListView(
                  children: pdfChildren(),
                );
              },
            ),
          );
          return  doc.save();
        });
  }

  List<pdf_widgets.Widget> pdfChildren() {
    if (widget.isTable) {
      return tableWidget();
    }
    return widget.data.map((PrintData data) {
      pdf_widgets.Widget? _child;
      final pdf_widgets.Widget _txtt = txt(data);

      if (data.richData != null) {
        return richTxt(data);
      }
      switch (data.widgetType) {
        case PrintWidgetType.title:
          _child = titleWidget(data);
        case PrintWidgetType.description:
          _child = subtitleWidget(data);
        case PrintWidgetType.leftRight:
          _child = leftRightWidget(data);

        case PrintWidgetType.img:
          if (data.imgBytes != null) {
            _child = imgWidget(data.imgBytes);
          } else {
            _child = _txtt;
          }

        case PrintWidgetType.bullet:
          _child = bulletWidget(data);

        default:
          _child = _txtt;
      }
      return pdf_widgets.Container(
        child: _child,
        // color: pdf.PdfColors.red,
        alignment: pdf_widgets.Alignment.centerLeft,
      );
    }).toList();
  }

  ///Returns the pdf color from material color
  pdf.PdfColor _pdfColor(Color mc) {
    return pdf.PdfColor.fromInt(mc.value);
  }

  pdf_widgets.TextStyle style({
    ///Instead of passing individually, we can directly pass the entire data to get the paramters
    PrintData? rawData,
    Color? color,
    double? fontSize,
    pdf_widgets.TextAlign? textAlign,
    bool? isBold,
    bool? isUnderlined,
    double? lineSpacing,
  }) {
    final double _fontSize = rawData?.fontSize ?? fontSize ?? 20;
    pdf.PdfColor? _color;

    final Color? mc = rawData?.color ?? color;
    if (mc != null) {
      _color = _pdfColor(mc);
    }
    final bool _isBold = rawData?.isBold ?? isBold ?? false;
    final bool _isUnderlined = rawData?.isUnderlined ?? isUnderlined ?? false;
    final double? _lineSpacing = rawData?.lineSpacing ?? lineSpacing;

    return pdf_widgets.TextStyle(
      fontSize: _fontSize,
      color: _color,
      fontWeight: _isBold ? pdf_widgets.FontWeight.bold : null,
      decoration: _isUnderlined ? pdf_widgets.TextDecoration.underline : null,
      lineSpacing: _lineSpacing,
    );
  }

  pdf_widgets.Text txt(Object? object) {
    final bool _isData = object is PrintData;
    return pdf_widgets.Text(
      _isData ? object.text : '$object',
      style: style(rawData: _isData ? object : null),
    );
  }

  pdf_widgets.RichText richTxt(PrintData data) {
    return pdf_widgets.RichText(
      text: pdf_widgets.TextSpan(
          children: List<pdf_widgets.TextSpan>.generate(data.richData!.length, (int index) {
        final PrintableRichString _richString = data.richData![index];
        String _text = _richString.text;

        ///If it's the last one, then no need to add extra space
        if (index > 0 && index != data.richData!.length - 1) {
          _text = '$_text ';
        }
        return pdf_widgets.TextSpan(
            text: _text,
            style: style(
              rawData: PrintData(
                '',

                ///For rich strings, the params will be supplied fromt he individual richstring first.
                ///If a param is not available, then it will look from parent printdata
                fontSize: _richString.fontSize ?? data.fontSize,
                isBold: _richString.isBold ?? data.isBold,
                isUnderlined: _richString.isUnderlined ?? data.isUnderlined,
                color: _richString.color ?? data.color,
                lineSpacing: _richString.lineSpacing ?? data.lineSpacing,
              ),
            ));
      })),
    );
  }

  pdf_widgets.Widget divider({
    pdf.PdfColor? color,
  }) {
    return pdf_widgets.Container(
      height: 1,
      color: color ?? pdf.PdfColors.grey,
    );
  }

  pdf_widgets.Widget titleWidget(PrintData data) {
    return pdf_widgets.Container(
      alignment: pdf_widgets.Alignment.center,
      width: double.maxFinite,
      padding: const pdf_widgets.EdgeInsets.all(12),
      child: txt(data),
    );
  }

  pdf_widgets.Widget subtitleWidget(PrintData data, {double top = 8}) {
    return pdf_widgets.Container(
      width: double.maxFinite,
      padding: pdf_widgets.EdgeInsets.only(bottom: 8, top: top),
      child: txt(data),
    );
  }

  pdf_widgets.Widget leftRightWidget(PrintData data) {
    return pdf_widgets.Container(
      alignment: pdf_widgets.Alignment.centerLeft,
      padding: const pdf_widgets.EdgeInsets.all(8),
      child: pdf_widgets.Row(
        children: <pdf_widgets.Widget>[
          pdf_widgets.Container(width: data.leftWidth ?? 200, child: txt(data)),
          txt(data.copyWith(text: ': ')),
          pdf_widgets.Flexible(
            child: txt(data.copyWith(
              text: data.right?.toString() ?? '',
              isBold: data.isRightBold,
            )),
          )
        ],
      ),
    );
  }

  pdf_widgets.Widget imgWidget(
    Uint8List? bytes, {
    pdf_widgets.Alignment alignment = pdf_widgets.Alignment.center,
    double height = 50,
    double width = 50,
  }) {
    return bytes == null
        ? pdf_widgets.Container()
        : pdf_widgets.Container(
            height: height,
            width: width,
            alignment: alignment,
            margin: const pdf_widgets.EdgeInsets.only(bottom: 8),
            child: pdf_widgets.Image(
              pdf_widgets.MemoryImage(bytes),
            ),
          );
  }

  pdf_widgets.Widget bulletWidget(PrintData data) {
    const double size = 5;
    return pdf_widgets.Row(crossAxisAlignment: pdf_widgets.CrossAxisAlignment.start, children: <pdf_widgets.Widget>[
      pdf_widgets.Container(
        height: size,
        width: size,
        margin: const pdf_widgets.EdgeInsets.all(8),
        decoration: pdf_widgets.BoxDecoration(
          shape: pdf_widgets.BoxShape.circle,
          color: _pdfColor(Colors.black),
        ),
      ),
      pdf_widgets.Expanded(child: txt(data))
    ]);
  }

  List<pdf_widgets.Widget> tableWidget() {
    pdf_widgets.Container container(pdf_widgets.Widget child) {
      return pdf_widgets.Container(
        padding: const pdf_widgets.EdgeInsets.all(8),
        // height: 100,
        // color: _pdfColor(Colors.green),
        child: child,
      );
    }

    return widget.data.map((PrintData data) {
      return pdf_widgets.Row(
        children: <pdf_widgets.Widget>[
          pdf_widgets.Expanded(
            flex: 2,
            child: container(txt(data)),
          ),
          pdf_widgets.Expanded(
            child: container(txt(data.copyWith(
              text: data.right?.toString() ?? '.',
              isBold: data.isRightBold,
              isUnderlined: false,
            ))),
          ),
        ],
      );
    }).toList();
  }
}
