import 'package:get/get.dart';
import 'package:newuser/app/modules/login/repo/login_repository.dart';
import 'package:newuser/app/service/provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(LoginRepository(provider: Provider())));
  }
}
