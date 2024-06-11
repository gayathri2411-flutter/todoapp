import 'package:get/get.dart';
import 'package:newuser/app/modules/register/repo/signup_repository.dart';
import 'package:newuser/app/service/provider.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController(SignUpRepository(provider: Provider())));
  }
}
