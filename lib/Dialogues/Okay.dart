part of 'Dialogues.dart';

/// The `OkayDialogue` class is a widget that represents a dialogue with a title, description, and an optional action button (Okay button). It is used to show informative messages or to ask for user confirmation.
class OkayDialogue extends StatelessWidget {
  /// Title of the dialogue.
  final String? title;

  /// Description of the dialogue.
  final String? description;

  /// Text to be displayed on the action button. If provided, the action button will be shown; otherwise, it will be hidden.
  final String? buttonText;

  /// Text to be displayed on the action button when it is in a processing state (e.g., when an asynchronous operation is in progress).
  final String? processingText;

  /// Callback function to be executed when the action button is pressed. If provided, the action button will be shown; otherwise, it will be hidden.
  final AsyncCallback? onPressed;

  ///Autoclose the dialogue after executing the function with await
  final bool autoClose;

  /// Alignment of the description text.
  final TextAlign? textAlign;

  /// Color of the dialogue and the action button.
  final Color? color;

  /// Optional child widget to be shown below the description.
  final Widget? child;

  ///To show the cancel button or not
  final bool showCancelButton;

  ///To show close button
  final bool showCloseButton;

  /// Constructor for the OkayDialogue class.
  const OkayDialogue({
    super.key,
    this.onPressed,
    this.textAlign,
    required this.description,
    this.buttonText,
    required this.title,
    this.processingText,
    this.color,
    this.child,
    this.showCancelButton = true,
    this.showCloseButton = true,
    this.autoClose = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialoguer(
      title: null,
      showActionBar: onPressed != null,
      autoClose: autoClose,
      onPressed: onPressed,
      buttonText: buttonText,
      showCancelButton: showCancelButton,
      color: color,
      showCloseButton: showCloseButton,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ListTile(
            title: Txt(
              title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            subtitle: Txt(
              description,
              fontSize: 16,
              textAlign: textAlign ?? TextAlign.center,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
