
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pdf/pdf.dart' as pdf;
import 'package:pdf/widgets.dart' as pdf_widgets;
import 'package:printing/printing.dart' as printing;

import '../Constants/Constants.dart';
import '../Extensions/Extensions.dart';
import '../Widgets/Widgets.dart';

part './ColorPicker.dart';
part './Datepicker.dart';
part './Dialoguer.dart';
part './Okay.dart';
part './Selection.dart';
part 'Print.dart';

///Common repository to handle all the dialogues used in this project
class Dialogues {
  Dialogues._privateConstructor();
  static final Dialogues _instance = Dialogues._privateConstructor();

  ///Quick instance of the dialogues
  static Dialogues get instance => _instance;

  ///Common alert dialogue to show before deleting a content
  static void delete(BuildContext context, {required AsyncCallback deleteFn}) {
    okay(
      context,
      color: Colors.red,
      title: 'Deletion Warning!',
      description: 'This process cannot be stopped, are you sure want to delete this?',
      onPressed: deleteFn,
      buttonText: 'Delete Permanently',
      processingText: 'Deleting...',
    );
  }

  ///Common dialogue to show before performing a major action except deleting
  static void warning(
    BuildContext context, {
    required String task,
    Color? color,
    required AsyncCallback onPressed,
  }) {
    okay(
      context,
      title: 'Do you want to $task?',
      description: 'Once started, this process can not be stopped, are you sure to $task?',
      buttonText: 'Yes, $task',
      onPressed: onPressed,
    );
  }

  ///Dialogue to make a selection
  static void select(
    BuildContext context, {
    String? title,
    bool fullSecreen = false,
    required Widget child,
    double? height,
    double? width,
    bool? enableTitle,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext builder) {
        final Widget dialogue = fullSecreen
            ? SelectionDialogue(
                title: title,
                enableTitle: enableTitle ?? true,
                child: child,
              )
            : Dialoguer(
                title: title ?? 'Select',
                height: height,
                width: width,
                enableTitle: enableTitle ?? true,
                child: child,
              );
        return dialogue;
        // return kDebugMode ? Emulator(child: dialogue) : dialogue;
      },
    );
  }

  ///Safe gaurds the user from accidentally closing an important page which is opened as a dialogue
  static Future<bool> goBack(BuildContext context) async {
    okay(
      context,
      title: 'Go back?',
      description: 'Are you sure want to go back?',
      buttonText: 'Yes, Go back',
      onPressed: () async {
        Widgets.pop(context);
      },
    );
    return false;
  }

  ///To show all the changes implemented in this version of the software
  static void changeLog(BuildContext context) {
    okay(context,
        title: 'Version ${AppInfo.webVersionName}',
        description: 'The following changes are implemented in this version',
        child: Flexible(
          child: ListView.builder(
              itemCount: AppInfo.changeLogs.length,
              itemBuilder: (BuildContext context, int index) {
                final String change = AppInfo.changeLogs[index];
                IconData icon = Icons.info;
                Color color = Colors.grey;
                if (change.contains('bug')) {
                  icon = Icons.bug_report;
                  color = Colors.green;
                }
                if (change.contains('improved')) {
                  icon = Icons.upcoming;
                  color = Colors.purple;
                }
                if (change.contains('added')) {
                  icon = Icons.add;
                  color = Colors.green;
                }
                if (change.contains('removed')) {
                  icon = Icons.remove;
                  color = Colors.red;
                }
                return ListTile(
                  leading: ColoredIcon(
                    icon: icon,
                    backgroundColor: color,
                    iconColor: Colors.white,
                  ),
                  title: Txt(change),
                );
              }),
        ));
  }

  ///To select the date
  static void selectDate(
    BuildContext context, {
    int minYears = 5,
    int maxYears = 5,
    required DateTime? selectedDateTime,
    bool allowYear = true,
    bool allowMonth = true,
    bool allowDay = true,
    required Function(DateTime) onSelected,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext builder) {
        return Datepickerdialogue(
          onSelected: onSelected,
          selectedDateTime: selectedDateTime,
          minYears: minYears,
          maxYears: maxYears,
          allowYear: allowYear,
          allowMonth: allowMonth,
          allowDay: allowDay,
        );
      },
    );
  }

  ///To acknowledge the user and optionally executing an action when acknowledged
  static Future<void> okay(
    BuildContext context, {
    bool barrierDismissible = true,
    TextAlign? textAlign,
    required String title,
    required String description,
    String? buttonText,
    String? processingText,
    AsyncCallback? onPressed,
    Color? color,
    Widget? child,
    bool showCancelButton = true,
    bool showCloseButton = true,
    bool autoClose = true,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext c) {
        return OkayDialogue(
          title: title,
          description: description,
          buttonText: buttonText,
          processingText: processingText,
          color: color,
          onPressed: onPressed,
          textAlign: textAlign,
          showCloseButton: showCloseButton,
          showCancelButton: showCancelButton,
          autoClose: autoClose,
          child: child,
        );
      },
    );
  }

  ///Shows the given child as a content
  static Future<void> show(
    BuildContext context, {
    String? title,
    bool barrierDismissible = true,
    required Widget child,
    double? height,
    double? width,
    bool showCloseButton = true,
    bool? enableTitle,
    bool dialoguer = true,
  }) async {
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext c) {
          return dialoguer
              ? Dialoguer(
                  enableTitle: enableTitle ?? title.isValid,
                  title: title,
                  height: height,
                  width: width,
                  showCloseButton: showCloseButton,
                  child: child,
                )
              : child;
        });
  }


/// pick color dialog
  static void pickColor(
    BuildContext context, {
    required Color? color,
    required Function(Color) onSelected,
  }) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return ColorPickerDialgue(
            color: color,
            onSelected: onSelected,
          );
        });
  }

/// print dialog
  static Future<void> print(
    BuildContext context, {
    required List<PrintData> data,
    bool isTable = false,
  }) async {
    await show(
      context,
      title: 'Print',

      ///DO NOT REMOVE THIS HEIGHT
      height: Widgets.mHeight(context),
      child: PrintingPage(
        data: data,
        isTable: isTable,
      ),
    );
  }
}
