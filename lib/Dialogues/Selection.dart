part of './Dialogues.dart';

/// The `SelectionDialogue` class is used to mimic a dialogue design for selecting any [Feature]. It provides a close button, a title, and a primary child to be shown.
class SelectionDialogue extends StatelessWidget {
  /// The primary child widget to be shown in the dialogue.
  final Widget child;

  /// An optional title for the dialogue.
  final String? title;

  /// by default [enableTitle]  = true . for custom edit we disable title
  final bool enableTitle;
  /// Constructor for the SelectionDialogue class.
  const SelectionDialogue({super.key, required this.child, this.title,this.enableTitle=true});

  @override
  Widget build(BuildContext context) {
    final double totalWidth = Widgets.mWidth(context);
    const double drawerWidth = 90;
    final double leftWidth = totalWidth - drawerWidth;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: <Widget>[
            if(enableTitle)ListTile(
              leading: const CloseButton(),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Txt(
                  title ?? 'Select',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: leftWidth,
                child: Material(
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
