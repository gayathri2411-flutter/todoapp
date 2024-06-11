import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:newuser/app/modules/forgotPassword/controllers/forgot_password_controller.dart';
import 'package:newuser/app/routes/app_pages.dart';
import 'package:newuser/app/widgets/exit_dialog.dart';
import 'package:pinput/pinput.dart';

class ResetPasswordView extends GetView<ForgotPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showExitPopup(context);
        return true;
      },
      child: Scaffold(
          body: Form(
        key: controller.formKey1,
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg_blur.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.only(top: 140, left: 16, right: 16),
            child: Center(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: Get.height / 600 * Get.height / 1.9,
                  width: Get.width,
                  color: Colors.black,
                  child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: MaterialButton(
                                height: 20,
                                minWidth: 19,
                                onPressed: () {
                                  Get.offNamedUntil(
                                      Routes.LOGIN, (route) => false);
                                },
                                shape: const CircleBorder(
                                    side: BorderSide(
                                        width: 2, color: Colors.amber)),
                                child: const Icon(
                                  Icons.close_outlined,
                                  size: 16,
                                  opticalSize: 20,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0, left: 27),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/cphone.png",
                                    color: Colors.amber,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Change Password",
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const Center(
                            child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.amber, fontSize: 24),
                        )),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Pinput(
                                      controller: controller.pinController,
                                      focusNode: controller.focusNode,
                                      androidSmsAutofillMethod:
                                          AndroidSmsAutofillMethod
                                              .smsUserConsentApi,
                                      listenForMultipleSmsOnAndroid: true,
                                      enabled: true,
                                      defaultPinTheme: PinTheme(
                                        width: 60,
                                        height: 50,
                                        textStyle: const TextStyle(
                                            fontSize: 22, color: Colors.black),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(),
                                        ),
                                      ),
                                      separatorBuilder: (index) =>
                                          const SizedBox(width: 8),
                                      showCursor: true,
                                      hapticFeedbackType:
                                          HapticFeedbackType.lightImpact,
                                      onCompleted: (pin) {
                                        debugPrint('onCompleted: $pin');
                                      },
                                      onChanged: (value) {
                                        debugPrint('onChanged: $value');
                                      },
                                      cursor: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 9),
                                            width: 2,
                                            height: 22,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                      autofocus: true,
                                      preFilledWidget: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ),
                                      disabledPinTheme: PinTheme(
                                        width: 60,
                                        height: 50,
                                        textStyle: const TextStyle(
                                            fontSize: 22, color: Colors.black),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(),
                                        ),
                                      ).copyWith(
                                        decoration: PinTheme(
                                          width: 60,
                                          height: 50,
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.black),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                        ).decoration!.copyWith(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.amber,
                                                  width: 2),
                                            ),
                                      ),
                                      followingPinTheme: PinTheme(
                                        width: 60,
                                        height: 50,
                                        textStyle: const TextStyle(
                                            fontSize: 22, color: Colors.black),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(),
                                        ),
                                      ).copyWith(
                                        decoration: PinTheme(
                                          width: 60,
                                          height: 50,
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.black),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                        ).decoration!.copyWith(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.amber,
                                                  width: 2),
                                            ),
                                      ),
                                      focusedPinTheme: PinTheme(
                                        width: 60,
                                        height: 50,
                                        textStyle: const TextStyle(
                                            fontSize: 22, color: Colors.black),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(),
                                        ),
                                      ).copyWith(
                                        decoration: PinTheme(
                                          width: 60,
                                          height: 50,
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.black),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                        ).decoration!.copyWith(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.amber,
                                                  width: 3),
                                            ),
                                      ),
                                      submittedPinTheme: PinTheme(
                                        width: 60,
                                        height: 50,
                                        textStyle: const TextStyle(
                                            fontSize: 22, color: Colors.black),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(),
                                        ),
                                      ).copyWith(
                                        decoration: PinTheme(
                                          width: 60,
                                          height: 50,
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.black),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                        ).decoration!.copyWith(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.amber,
                                                  width: 3),
                                            ),
                                      ),
                                      errorPinTheme: PinTheme(
                                        width: 60,
                                        height: 50,
                                        textStyle: const TextStyle(
                                            fontSize: 22, color: Colors.black),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(),
                                        ),
                                      ).copyBorderWith(
                                        border: Border.all(
                                            color: Colors.amber, width: 3),
                                      ),
                                    ),
                                    MaterialButton(
                                      height: 30,
                                      minWidth: 30,
                                      onPressed: () {
                                        controller.pinController.clear();
                                      },
                                      shape: const CircleBorder(
                                          side: BorderSide(
                                              width: 2, color: Colors.white)),
                                      child: const Icon(
                                        Icons.close_outlined,
                                        size: 30,
                                        opticalSize: 20,
                                        weight: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 20),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: controller.password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  controller.newpass.value = true;
                                  return null;
                                } else {
                                  controller.newpass.value = false;
                                  return null;
                                }
                              },
                              cursorColor: Colors.grey,
                              onChanged: (v) {},
                              onTap: () {},
                              focusNode: controller.focusNode1,
                              cursorWidth: 3,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: 'Enter Confirm Password',
                                  alignLabelWithHint: true,
                                  hintStyle: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2)),
                                  isDense: true,
                                  enabled: true,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2))),
                            ),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: controller.newpass.value,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10, left: 16),
                              child: Text(
                                "Enter New Password",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            height: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: controller.confirmPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  controller.confirmpass.value = true;
                                  return null;
                                } else {
                                  controller.confirmpass.value = false;
                                  return null;
                                }
                              },
                              cursorColor: Colors.grey,
                              enabled: true,
                              onChanged: (v) {},
                              onTap: () {},
                              obscureText: true,
                              focusNode: controller.focusNode2,
                              decoration: const InputDecoration(
                                  hintText: 'Confirm Your Password',
                                  alignLabelWithHint: true,
                                  hintStyle: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2)),
                                  isDense: true,
                                  enabled: true,
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2))),
                            ),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: controller.confirmpass.value,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10, left: 16),
                              child: Text(
                                "Enter Confirm Password",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: controller.secondsRemaining.value != 0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      controller.secondsRemaining.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Visibility(
                            visible: controller.secondsRemaining.value == 0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text("Not received the OTP yet?"),
                                  TextButton(
                                      onPressed: () {
                                        controller.resendCode();
                                      },
                                      child: const Text(
                                        "Resend OTP",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 1, 101, 183)),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              height: 45,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.amber),
                              child: TextButton(
                                  onPressed: () {
                                    final form = controller
                                        .formKey1.currentState!
                                        .validate();
                                    if (form == true) {
                                      if (controller.newpass.value == false &&
                                          controller.confirmpass.value ==
                                              false) {
                                        if (controller.pinController.length ==
                                            4) {
                                          controller.resetPassword();
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Enter Otp",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.white,
                                              textColor: Colors.black,
                                              fontSize: 14.0);
                                        }
                                      } else {}
                                    }
                                  },
                                  child: const Text(
                                    "SUBMIT",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )),
                      ]),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
