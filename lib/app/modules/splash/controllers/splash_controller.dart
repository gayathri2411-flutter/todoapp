import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newuser/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    var jwt = GetStorage().read('jwt');
    var id = GetStorage().read('id');
    Future.delayed(const Duration(seconds: 2), () {
      if (id != null && jwt != null) {
        Get.toNamed(Routes.HOME);
      } else {
        Get.toNamed(Routes.WELCOME);
      }
    });
  }
}
