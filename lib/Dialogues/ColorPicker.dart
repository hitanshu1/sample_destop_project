part of './Dialogues.dart';

///Dialogue to pick or remove color
class ColorPickerDialgue extends StatefulWidget {
  ///Currently selected color
  final Color? color;

  ///Function to be executed on selection
  final Function(Color) onSelected;
  ///constructor
  const ColorPickerDialgue({
    super.key,
    required this.color,
    required this.onSelected,
  });

  @override
  State<ColorPickerDialgue> createState() => _ColorPickerDialgueState();
}

class _ColorPickerDialgueState extends State<ColorPickerDialgue> {
  Color? color;

  @override
  void initState() {
    color = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialoguer(
      title: 'Color Picker',
      showActionBar: color != null,
      onPressed: () {
        widget.onSelected(color!);
      },
      child: SizedBox(
        height: 420,
        width: double.maxFinite,
        child: ColorPicker(
          portraitOnly: true,
          pickerColor: color ?? Colorz.primary,
          onColorChanged: (_) {
            if (mounted) {
              setState(() => color = _);
            }
          },
          enableAlpha: false,
          pickerAreaHeightPercent: 0.75,
          labelTypes: const <ColorLabelType>[ColorLabelType.rgb],
          paletteType: PaletteType.hueWheel,
          pickerAreaBorderRadius: BorderRadius.circular(8),
          hexInputBar: true,
        ),
      ),
    );
  }
}
