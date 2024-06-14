import 'package:flutter/material.dart';

///complex drawer menu
class CDM {
 /// icon of menu
  final IconData icon;
  /// title of menu
  final String title;
  /// submenus list
  final List<String> submenus;

  /// expanded use to check is the menu will expanded Tile of not
  final bool expanded;
  /// page index


/// constructor of CDM
  CDM(this.icon, this.title, this.submenus,this.expanded);
}
