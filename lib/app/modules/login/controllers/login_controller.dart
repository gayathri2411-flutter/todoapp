// ignore_for_file: avoid_print, body_might_complete_normally_catch_error

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:newuser/app/modules/login/model/login_request.dart';
import 'package:newuser/app/modules/login/repo/login_repository.dart';
import 'package:newuser/app/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

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
    final phoneRegex =
        RegExp(r'^[0-9]{10}$'); // Assumes phone number is 10 digits
    return phoneRegex.hasMatch(input);
  }

  void login() async {
    // var phoneNumber = await GetStorage().read("phoneNumber");
    LoginRequest request = LoginRequest();
    request.domain = "KERALACABS";
    if (isEmail(emailOrphone.text)) {
      request.email = emailOrphone.text;
      request.phoneNumber = "";
    } else if (isPhoneNumber(emailOrphone.text)) {
      request.email = "";
      request.phoneNumber = emailOrphone.text;
    } else {
      print("Invalid input.");
      return;
    }

    request.password = loginPassword.text;

    request.token = "string";

    await repo
        .login(request: request)
        .then((value) => {
              if (value.status == true)
                {
                  Fluttertoast.showToast(
                      msg: value.message.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 14.0),
                  if (value.data != null && value.data!.id != null)
                    {
                      print(value.data!.id),
                      GetStorage().write("id", value.data!.id.toString()),
                    },
                  GetStorage().write("jwt", value.jwt.toString()),
                  Get.offNamedUntil(Routes.HOME, (route) => false)
                }
              else
                {
                  Fluttertoast.showToast(
                      msg: value.message.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 14.0)
                }
            })
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0);
      debugPrint(e);
    });
  }

  permission() async {
    if (await Permission.location.request().isGranted) {
      print("Granted");
      // Either the permission was already granted before or the user just granted it.
    } else if (await Permission.location.isPermanentlyDenied) {
      print("nooo");
      openAppSettings();
    } else {
      print("else");
    }

    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
    print("got");
    print(statuses[Permission.location]);
  }
}
