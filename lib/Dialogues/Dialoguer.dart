part of './Dialogues.dart';

/// The `Dialoguer` class is a common widget designed to be shown inside dialogues to reduce code redundancy.
class Dialoguer extends StatelessWidget {
  /// Title of the dialogue.
  final String? title;

  /// Optional description of the dialogue.
  final String? description;

  /// Primary child to be shown inside the dialogue.
  final Widget child;

  /// To show or hide the action bar (ActionBar widget).
  final bool showActionBar;

  /// Primary color of the dialogue and the action bar.
  final Color? color;

  /// Optional background color to be used as the background color of the dialogue.
  final Color? backgroundColor;

  /// Text color of the action button in the action bar.
  final Color? actionButtonTextColor;

  /// Function to be executed when the action button in the action bar is pressed.
  final Function? onPressed;

  ///Read ActionButton
  final bool autoClose;

  /// To use an [Expanded] widget as the parent of the primary [child]. If true, the child will be flexible.
  final bool isFlexible;

  /// Width of the selection dialogue.
  final double? width;

  ///Height of the dialogue
  final double? height;

  /// Text to be displayed on the action button in the action bar.
  final String? buttonText;

  /// Optional widget to be shown under the action bar.
  final Widget? footer;

  /// by default [enableTitle]  = true . for custom edit we disable title
  final bool enableTitle;

  ///To show cancel button along with action button
  final bool showCancelButton;

  ///To show close button
  final bool showCloseButton;

  ///To show big button or not
  final bool isBig;

  /// Constructor for the Dialoguer class.
  const Dialoguer({
    super.key,
    this.width,
    required this.title,
    this.description,
    required this.child,
    this.showActionBar = false,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.autoClose = true,
    this.isFlexible = true,
    this.actionButtonTextColor,
    this.buttonText,
    this.footer,
    this.height,
    this.showCancelButton = true,
    this.enableTitle = true,
    this.showCloseButton = true,
    this.isBig = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isMobile = constraints.maxWidth <= 800;
          return Container(
            height: height,
            width: isMobile ? null : width ?? 600,
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24.0),
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (enableTitle) titleWidget(),
                    if (isFlexible) Flexible(child: child) else child,
                    if (showActionBar) actionBar(context),
                    if (footer != null) footer!,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Creates the title widget of the dialogue.
  Widget titleWidget() {
    return ListTile(
      title: title == null
          ? null
          : Txt(
              title,
              fontWeight: FontWeight.bold,
            ),
      subtitle: description == null ? null : Txt(description),
      trailing: showCloseButton ? const CloseButton() : null,
    );
  }

  /// Creates the footer widget of the dialogue, which is the action bar (ActionBar widget).
  Widget actionBar(BuildContext context) {
    return CrossFade(
      useCenter: false,
      show: showActionBar,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            if (showCancelButton) cancelButton(context),
            actionButton(context),
          ],
        ),
      ),
    );
  }

  ///If cancelled, just the [Dialogue] or [Page] will be closed on pressing
  Widget cancelButton(BuildContext context) {
    return Expanded(
      child: Button(
        isBig: isBig,
        isVoid: true,
        isOutlined: true,
        text: 'Cancel',
        elevation: 0,
        textColor: Colors.grey,
        buttonColor: Colors.grey.withOpacity(0.1),
        onPressed: () {
          Widgets.pop(context);
        },
      ),
    );
  }

  ///[onPressed] functions will be excecuted with automatic [Poping]
  Widget actionButton(BuildContext context) {
    return Expanded(
      child: Button(
        isBig: isBig,
        icon: Icons.check,
        text: buttonText ?? 'Confirm',
        processingText: 'Processing...',
        textColor: actionButtonTextColor ?? Colors.white,
        buttonColor: color,
        onPressed: () async {
          if (onPressed != null) {
            await onPressed!();
          }
          if (autoClose) {
            Widgets.pop(context);
          }
        },
      ),
    );
  }
}
