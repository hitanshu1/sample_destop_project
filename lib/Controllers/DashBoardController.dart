
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// controller use manage state of dashboard screen
class DashBoardController extends GetxController{

  /// dashBoard current page index
  int currentIndex=0;
  /// scaffoldKey for dashboard
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  /// function use to change view of page
  void onChangeIndex(int index){
    currentIndex=index;
    scaffoldKey.currentState?.closeDrawer();
    update();
  }
}
