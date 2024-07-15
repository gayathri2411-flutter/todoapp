import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:newuser/app/modules/login/model/login_request.dart';
import 'package:newuser/app/modules/login/repo/login_repository.dart';
import 'package:newuser/app/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../widgets/shared_functions.dart';

class LoginController extends GetxController {
  final LoginRepository repo;
  LoginController(this.repo);

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailOrphone = TextEditingController();
  final loginPassword = TextEditingController();
  RxBool number = false.obs;
  RxBool password = false.obs;
  RxBool pass = false.obs;

  @override
  void onInit() {
    super.onInit();
    permission();
  }

  @override
  void dispose() {
    // Dispose the FocusNode when not needed
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  bool isEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(input);
  }

  bool isPhoneNumber(String input) {
    final phoneRegex = RegExp(r'^[0-9]{10}$'); // Assumes phone number is 10 digits
    return phoneRegex.hasMatch(input);
  }

  void login() async {
    debugPrint('Login attempt started');

    LoginRequest request = LoginRequest();
    debugPrint('LoginRequest created');
    request.domain = "KERALACABS";
    debugPrint('Domain set to KERALACABS');

    if (isEmail(emailOrphone.text)) {
      request.email = emailOrphone.text;
      request.phoneNumber = "";
      debugPrint('Email detected: ${emailOrphone.text}');
    } else if (isPhoneNumber(emailOrphone.text)) {
      request.email = "";
      request.phoneNumber = emailOrphone.text;
      debugPrint('Phone number detected: ${emailOrphone.text}');
    } else {
      debugPrint("Invalid input.");
      return;
    }

    request.password = loginPassword.text;
    request.token = 'string';
    debugPrint('Token: ${request.token}');

    String token = "";
    await getDeviceToken().then((value) => {
      token = value,
      print('Created token: $token'),
    });

    try {
      final value = await repo.login(request: request);
      if (value.status == true) {
        Get.snackbar("Success", value.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        if (value.data != null && value.data!.id != null) {
          debugPrint('User ID: ${value.data!.id}');
          GetStorage().write("id", value.data!.id.toString());
        }
        GetStorage().write("jwt", value.jwt.toString());
        Get.offNamedUntil(Routes.HOME, (route) => false);
      } else {
        Get.snackbar("Error", value.message.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e, stackTrace) {
      Get.snackbar("Error", "Login failed: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      debugPrint('Login error: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  permission() async {
    if (await Permission.location.request().isGranted) {
      debugPrint("Location permission granted");
    } else if (await Permission.location.isPermanentlyDenied) {
      debugPrint("Location permission permanently denied");
      openAppSettings();
    } else {
      debugPrint("Location permission denied");
    }

    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
    debugPrint("Permissions status:");
    debugPrint(statuses[Permission.location].toString());
  }
}
