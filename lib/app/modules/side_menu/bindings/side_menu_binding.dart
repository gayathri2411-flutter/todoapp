       import 'package:get/get.dart';
import 'package:newuser/app/modules/side_menu/repo/side_menu_repository.dart';
import 'package:newuser/app/service/provider.dart';

import '../controllers/side_menu_controller.dart';

class SideMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SideMenuController(SideMenuRepository(provider: Provider())));
  }
}
