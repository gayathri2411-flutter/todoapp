import 'package:get/get.dart';
import 'package:newuser/app/modules/forgotPassword/repo/forgot_password_repository.dart';
import 'package:newuser/app/service/provider.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ForgotPasswordController(ForgotPasswordRepository(provider: Provider())),
    );
  }
}
