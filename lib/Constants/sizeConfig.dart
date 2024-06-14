import 'package:flutter/cupertino.dart';

/// SizeConfig file contains all size of widget we can modify size from here
class SizeConfig {
  const SizeConfig._();

  /// spaceBetween two widgets
  static  double spaceBetween = 10;

  /// smaller font size
  static double smallerFont = 10;

  /// small font size
  static double smallFont = 13;

  /// medium font size
  static double mediumFont = 16;

  /// large font size
  static double largeFont = 18;

  /// common border Radius
  static double borderRadius = 8;

  /// vertical small space between widgets
  static Widget verticalSpaceSmall() {
    return SizedBox(
      height: spaceBetween * .8,
    );
  }

  /// vertical  space between widgets
  static Widget verticalSpace() {
    return SizedBox(
      height: spaceBetween,
    );
  }
  /// vertical medium space between widgets
  static Widget verticalSpaceMedium() {
    return SizedBox(
      height: spaceBetween * 1.2,
    );
  }
  /// vertical large space between widgets
  static Widget verticalSpaceLarge() {
    return SizedBox(
      height: spaceBetween * 2,
    );
  }
  /// horizontal  space between widgets
  static Widget horizontalSpace() {
    return SizedBox(
      width: spaceBetween,
    );
  }
}
