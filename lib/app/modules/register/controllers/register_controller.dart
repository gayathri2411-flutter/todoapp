// ignore_for_file: body_might_complete_normally_catch_error

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newuser/app/modules/register/model/otp_submit_request.dart';
import 'package:newuser/app/modules/register/model/register_otp_request.dart';
import 'package:newuser/app/modules/register/model/signup_request.dart';
import 'package:newuser/app/modules/register/repo/signup_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newuser/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final SignUpRepository repo;
  RegisterController(this.repo);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  RxString error = ''.obs;
  RxBool err = true.obs;
  RxBool accept = false.obs;

  RxBool visible = true.obs;
  final pinController = TextEditingController();
  final mobilenumber = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final focusNode = FocusNode();
  RxInt secondsRemaining = 29.obs;
  RxBool enableResend = false.obs;
  RxBool acceptTearms = true.obs;
  late Timer timer;
  @override
  void onInit() {
    super.onInit();
    
  }

  void resendCode() {
    secondsRemaining.value = 29;
    enableResend.value = false;
    sendOtp();
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
        enableResend.value = true;
      }
    });
  }
  void sendOtp() async {
    RegisterOtpRequest request = RegisterOtpRequest();
    request.companyName = "KERALACABS";
    request.countryCode = "+91";
    request.password = "string";
    request.phoneNumber = mobilenumber.text;
    request.rideId = "string";
    request.role = "ROLE_USER";
    request.token = "string";
    request.userId = "string";
    await repo
        .registerOtp(request: request)
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
                  Get.toNamed(Routes.REGISTER_OTP),
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

  void otpSubmit() async {
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
        .otpSubmit(request: request)
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
                  Get.toNamed(Routes.SIGN_UP),
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

  void signUp() async {
    SignUpRequest request = SignUpRequest();
    request.carType = "string";
    request.category = "TAXI";
    request.domain = "KERALACABS";
    request.email = email.text;
    request.firstName = name.text;
    request.id = "0";
    request.lastName = "string";
    request.latitude = 0.0;
    request.longitude = 0.0;
    request.password = password.text;
    request.phoneNumber = mobilenumber.text;
    request.phoneVerified = "string";
    request.role = "ROLE_USER";
    request.website = "KERALACABS";
    GetStorage().write('phoneNumber', mobilenumber.text);
    await repo
        .signUp(request: request)
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
