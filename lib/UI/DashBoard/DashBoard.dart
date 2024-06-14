import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/DashBoardController.dart';
import 'Home/Home.dart';
import 'Pos/posPage.dart';
import 'Sell/GiftCard/AddGiftCardPage.dart';
import 'Sell/ReturnListPage.dart';
import 'Sell/SellListPage.dart';
import 'Sell/SellLogsPage.dart';
import 'drawer.dart';

/// app dashBoard page
class DashBoardPage extends StatelessWidget {
  /// constructor
  const DashBoardPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (DashBoardController gxValues) {
        return Scaffold(
          key: gxValues.scaffoldKey,
          appBar: AppBar(
            title: const Text('Dashboard - STORE 01'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.point_of_sale),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.book),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.receipt),
                onPressed: () {},
              ),
            ],
          ),
          drawer:const DashBoardDrawer(),
          body: _body(gxValues.currentIndex),
        );
      }
    );
  }

  Widget _body(int index){
    if(index==5){
      return const AddGiftCardPage();
    }
    if(index==4){
      return  SellLogsPage();
    }
    if(index==3){
      return  ReturnListPage();
    }
    if(index==2){
      return  SellListPage();
    }
    if(index==1){
      return const PosPage();
    }
    return const HomePage();
  }
}
