import 'package:get/get.dart';
import 'package:newuser/app/modules/home/repo/home_repository.dart';
import 'package:newuser/app/service/provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(HomeRepository(provider: Provider())));
  }
}
