
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/Constants.dart';
import '../../Constants/sizeConfig.dart';
import '../../Controllers/DashBoardController.dart';
import '../../Models/CDM.dart';
import '../../Widgets/Widgets.dart';

/// dashBoard Drawer
class DashBoardDrawer extends StatefulWidget {
  /// constructor
  const DashBoardDrawer({super.key});

  @override
  State<DashBoardDrawer> createState() => _DashBoardDrawerState();
}

class _DashBoardDrawerState extends State<DashBoardDrawer> {


  DashBoardController dashBoardController=Get.put(DashBoardController());
  int selectedIndex = 0; //dont set it to 0

  bool isExpanded = false;

  bool viewSubMenu=false;
  void _onChangePage(String pageName) {
    switch (pageName) {
      case 'DASHBOARD':
        dashBoardController.onChangeIndex(0);
      case 'POINT OF SALE':
        dashBoardController.onChangeIndex(1);
      case 'SELL LIST':
        dashBoardController.onChangeIndex(2);
      case 'RETURN LIST':
        dashBoardController.onChangeIndex(3);
      case 'SELL LOG':
        dashBoardController.onChangeIndex(4);
      case 'ADD GIFT CARD':
        dashBoardController.onChangeIndex(5);
      case 'GIFT CARD LIST':
        dashBoardController.onChangeIndex(5);
      default:

    }
  }


  @override
  Widget build(BuildContext context) {
      final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: row(),
      // color: Colorz.compexDrawerCanvasColor,
    );
  }

  Widget row() {
    return Row(children: <Widget>[
      if (isExpanded) blackIconTiles() else blackIconMenu(),
      invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return Container(
      width: 200,
      color: Colorz.drawerColor,
      child: Column(
        children: <Widget>[
          controlTile(),
          Expanded(
            child: ListView.builder(
              itemCount: cdms.length,
              itemBuilder: (BuildContext context, int index) {

                final CDM cdm = cdms[index];
              
                if(!cdm.expanded){
                  return ListTile(
                    onTap: (){
                      _onChangePage(cdm.title);
                    },
                    leading: Icon(cdm.icon, color: Colors.black),
                    title: Txt(
                      cdm.title,
                      color: Colors.black,
                      fontSize: SizeConfig.smallFont,
                    ),
                  );
                }
                return ExpansionTile(
                    onExpansionChanged: (bool z) {
                      setState(() {
                        selectedIndex = z ? index : -1;
                      });
                    },
                    leading: Icon(cdm.icon, color: Colors.black),
                    title: Txt(
                      cdm.title,
                      color: Colors.black,
                      fontSize: SizeConfig.smallFont,
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: cdm.submenus.map((String subMenu) {
                      return sMenuButton(subMenu, false);
                    }).toList());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget controlTile() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: ListTile(
        leading: const FlutterLogo(),
        title: const Txt(
           'Your Name',
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        onTap: expandOrShrinkDrawer,
      ),
    );
  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: 70,
      color: Colorz.drawerColor,
      child: Column(
        children: <Widget>[
          controlButton(),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (BuildContext context,int index) {

                  return InkWell(
                    onTap: () {
                      setState(() {
                        if(selectedIndex==index){
                          viewSubMenu=!viewSubMenu;
                        }else{
                          viewSubMenu=true;
                        }
                        selectedIndex = index;
                        _onChangePage(cdms[index].title);

                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(cdms[index].icon, color: Colors.black),
                    ),
                  );
                }),
          ),
          // accountButton(),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    // List<CDM> _cmds = cdms..removeAt(0);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 10),
      width: viewSubMenu&&(!isExpanded) ? 125 : 0,
      // color: Colorz.compexDrawerCanvasColor,
      child: Column(
        children: <Widget>[
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (BuildContext context, int index) {
                  final CDM cmd = cdms[index];
                  // if(index==0) return Container(height:95);
                  //controll button has 45 h + 20 top + 30 bottom = 95

                  final bool selected = selectedIndex == index;
                  final bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
                  return subMenuWidget(<String>[cmd.title, ...cmd.submenus], isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: const FlutterLogo(
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 33.5 : 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu ? Colorz.black : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: const EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (BuildContext context, int index) {
            final String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0);
          }),
    );
  }

  Widget sMenuButton(String subMenu, bool isTitle) {
    return InkWell(
      onTap: () {
        viewSubMenu=false;
        setState(() {

        });
        _onChangePage(subMenu);
        //handle the function
        //if index==0? donothing: doyourlogic here
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Txt(
          subMenu,
          fontSize: isTitle ? SizeConfig.smallFont : SizeConfig.smallerFont,
          color: isTitle ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white70,
          // image: DecorationImage(
          //   image: NetworkImage(Urls.avatar2),
          //   fit: BoxFit.cover,
          // ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }



  static List<CDM> cdms = <CDM>[
    // CDM(Icons.grid_view, "Control", []),

    CDM(Icons.dashboard, 'DASHBOARD', <String>[],false),
    CDM(Icons.point_of_sale, 'POINT OF SALE', <String>[],false),
    CDM(Icons.sell, 'SELL', <String>['SELL LIST','RETURN LIST','SELL LOG','ADD GIFT CARD','GIFT CARD LIST'],true),
    CDM(Icons.report, 'REPORTS OVERVIEW', <String>[],true),

  ];

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
