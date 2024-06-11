import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../controllers/register_controller.dart';

class RegisterOtpView extends GetView<RegisterController> {
  const RegisterOtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: controller.formKey1,
        child: ListView(
          children: [
            Container(
              height: Get.height / 1.8,
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SizedBox(
                              height: 20,
                              child: Image.asset(
                                "assets/cphone.png",
                                color: Colors.amber,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Change Mobile Number",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        "assets/otp_img.png",
                        color: Colors.white,
                      )),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Please wait, While we are reading\n  you OTP message to verify",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Enter the OTP below manually if you have\n              received in another phone",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
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
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                enabled: true,
                                defaultPinTheme: PinTheme(
                                  width: 60,
                                  height: 50,
                                  textStyle: const TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                ),
                                separatorBuilder: (index) =>
                                    const SizedBox(width: 8),
                                // validator: (value) {
                                //   return value == '9999'
                                //       ? null
                                //       : 'Pin is incorrect';
                                // },
                                // onClipboardFound: (value) {
                                //   debugPrint('onClipboardFound: $value');
                                //   pinController.setText(value);
                                // },
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
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
                                    borderRadius: BorderRadius.circular(8),
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
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                ).copyWith(
                                  decoration: PinTheme(
                                    width: 60,
                                    height: 50,
                                    textStyle: const TextStyle(
                                        fontSize: 22, color: Colors.black),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                  ).decoration!.copyWith(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.amber, width: 2),
                                      ),
                                ),
                                followingPinTheme: PinTheme(
                                  width: 60,
                                  height: 50,
                                  textStyle: const TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                ).copyWith(
                                  decoration: PinTheme(
                                    width: 60,
                                    height: 50,
                                    textStyle: const TextStyle(
                                        fontSize: 22, color: Colors.black),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                  ).decoration!.copyWith(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.amber, width: 2),
                                      ),
                                ),

                                focusedPinTheme: PinTheme(
                                  width: 60,
                                  height: 50,
                                  textStyle: const TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                ).copyWith(
                                  decoration: PinTheme(
                                    width: 60,
                                    height: 50,
                                    textStyle: const TextStyle(
                                        fontSize: 22, color: Colors.black),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                  ).decoration!.copyWith(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.amber, width: 3),
                                      ),
                                ),
                                submittedPinTheme: PinTheme(
                                  width: 60,
                                  height: 50,
                                  textStyle: const TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                ).copyWith(
                                  decoration: PinTheme(
                                    width: 60,
                                    height: 50,
                                    textStyle: const TextStyle(
                                        fontSize: 22, color: Colors.black),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(),
                                    ),
                                  ).decoration!.copyWith(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.amber, width: 3),
                                      ),
                                ),
                                errorPinTheme: PinTheme(
                                  width: 60,
                                  height: 50,
                                  textStyle: const TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                ).copyBorderWith(
                                  border:
                                      Border.all(color: Colors.amber, width: 3),
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
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 60),
                child: Container(
                  height: 45,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber),
                  child: TextButton(
                      onPressed: () {
                        if (controller.pinController.length == 4) {
                          controller.otpSubmit();
                        } else {}
                      },
                      child: const Text(
                        "Proceed",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                )),
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
                          onPressed: controller.enableResend.value
                              ? controller.resendCode
                              : null,
                          //  (){
                          //   controller.resendCode();
                          // },
                          child: const Text(
                            "Resend OTP",
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 101, 183)),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
