// ignore_for_file: body_might_complete_normally_catch_error, unnecessary_overrides
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:newuser/app/modules/forgotPassword/model/forgot_password_otp_request.dart';
import 'package:newuser/app/modules/forgotPassword/repo/forgot_password_repository.dart';
import 'package:newuser/app/modules/register/model/otp_submit_request.dart';
import 'package:newuser/app/routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordRepository repo;
  ForgotPasswordController(this.repo);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final mobilenumber = TextEditingController();
  final pinController = TextEditingController();
  RxBool err = false.obs;
  RxString error = ''.obs;
  final focusNode = FocusNode();
  RxInt secondsRemaining = 15.obs;
  RxBool enableResend = true.obs;
  late Timer timer;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  RxBool newpass = false.obs;
  RxBool confirmpass = false.obs;
  @override
  void onInit() {
    super.onInit();
   
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    timer.cancel();
    super.dispose();
  }
  void start(){
   timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 0) {
        secondsRemaining.value--;
      } else {
        secondsRemaining.value = 0;
      }
    });
  }
  void resendCode() {
    print("yess");
    secondsRemaining.value = 15;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 0) {
        secondsRemaining.value--;
      } else {
        secondsRemaining.value = 0;
      }
    });

    sendOtp();
  }

  void sendOtp() async {
    ForgotPasswordRequest request = ForgotPasswordRequest();
    request.companyName = "KERALACABS";
    request.countryCode = "+91";
    request.password = "string";
    request.phoneNumber = mobilenumber.text;
    request.rideId = "string";
    request.role = "ROLE_USER";
    request.token = "string";
    request.userId = "string";

    await repo
        .forgotpasswordOtp(request: request)
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
                  Get.toNamed(Routes.RESET_PASSWORD),
                  start(),
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
                      fontSize: 14.0),
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

  void resetPassword() async {
    OtpSubmitRequest request = OtpSubmitRequest();
    request.companyName = "KERALACABS";
    request.countryCode = "+91";
    request.password = "string";
    request.phoneNumber = mobilenumber.text;
    request.rideId = "string";
    request.role = "ROLE_USER";
    request.token = pinController.text;
    request.userId = "string";
    await repo
        .resetPassword(request: request)
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
                  Get.offNamedUntil(Routes.LOGIN, (route) => false)
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
}
