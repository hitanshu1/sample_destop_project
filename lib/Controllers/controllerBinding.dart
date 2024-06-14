
import 'package:get/get.dart';
import 'DashBoardController.dart';

import 'GiftCardController.dart';
import 'UserController.dart';
import 'posPageController.dart';

/// all controller initialize here
class ControllersBinding{
  const ControllersBinding._();


  /// controllers initialize function
 static void initialize(){
    Get.lazyPut<DashBoardController>(
          () => DashBoardController(),
    );
    Get.lazyPut<PosPageController>(
          () => PosPageController(),
    );
    Get.lazyPut<GiftCardController>(
          () => GiftCardController(),
    );
    Get.lazyPut<UserController>(
          () => UserController(),
    );

  }
}
