part of './Constants.dart';

/// List of colors which are used in primary sections will be stored here.
class Colorz {
  /// Private constructor to prevent instantiation.
  Colorz._();

  ///Primary colors of the app
  static const Color primary = Color(0xff4db4b9);
  ///blue colors of the app
  static const Color blue = Color(0xff147ef1);
  ///offWhite colors of the app
  static const Color offWhite = Color(0xfff2f2f2);
  ///skyBlue colors of the app
  static const Color skyBlue = Color(0xFFd0e4fc);
  ///white colors of the app
  static const Color white = Colors.white;
  ///black colors of the app
  static const Color black = Colors.black;
  ///drawerColor colors of the app
  static const Color drawerColor = Colors.white;

  ///red colors of the app
  static const Color red = Colors.redAccent;

  ///gray colors of the app
  static const Color gray = Colors.grey;

  ///canvasColor colors of the app
  static Color canvasColor = Colors.white;

  ///green colors of the app
  static Color green = Colors.green;

  ///primary dark colors of the app
  static Color get dark => primary.dark();

}
