import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_blur.png"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 140, left: 16, right: 16),
          child: Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 310,
                width: Get.width,
                color: Colors.black,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          height: 20,
                          minWidth: 19,
                          onPressed: () {
                            Get.back();
                          },
                          shape: const CircleBorder(
                              side: BorderSide(width: 2, color: Colors.amber)),
                          child: const Icon(
                            Icons.close_outlined,
                            size: 16,
                            opticalSize: 20,
                            color: Colors.amber,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Center(
                      child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.amber, fontSize: 24),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          emptySearchBuilder: (context) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(child: Text("No Country Found")),
                            );
                          },
                          searchDecoration: InputDecoration(

                              iconColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          showOnlyCountryWhenClosed: false,
                          textStyle: const TextStyle(color: Colors.white),
                          dialogBackgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          onChanged: print,
                          initialSelection: 'IN',
                          countryFilter: const ['IN', 'CH'],
                          showCountryOnly: true,
                          showFlagMain: true,
                          comparator: (a, b) =>
                              b.name!.compareTo(a.name.toString()),
                          //Get the country information relevant to the initial selection
                          onInit: (code) => debugPrint(
                              "on init ${code!.name} ${code.dialCode} ${code.name}"),

                          showFlag: true,
                          showFlagDialog: true,
                          // favorite: const ['+91', 'IN'],
                          enabled: true,
                        ),
                        SizedBox(
                          width: Get.width / 1.7,
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.only(right:10.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length == 10) {
                                  controller.err.value = true;
                                  controller.error.value =
                                      'Yes, This is a valid number';
                                  return null;
                                } else if (value.length < 10 ||
                                    value.length > 10) {
                                  controller.err.value = false;
                                  controller.error.value = 'This is not a valid number';
                                  return null;
                                }
                                controller.err.value = true;
                                return null;
                              },
                              controller: controller.mobilenumber,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              cursorHeight: 20,
                              enabled: true,
                              onChanged: (v) {
                                controller.formKey.currentState!.validate();
                              },
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 5, left: 5),
                                  isDense: false,
                                  enabled: true,
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: '8123456789',
                                  helperStyle: TextStyle(fontSize: 24),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.amber))),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50, top: 15),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          controller.error.value != ''
                              ? controller.err.value == true
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.info_sharp,
                                      color: Colors.red,
                                      size: 20,
                                    )
                              : const Text(''),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              controller.error.value.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: controller.err.value == true
                                  ? Colors.amber
                                  : Colors.black),
                          child: TextButton(
                              onPressed: () {
                                if (controller.err.value == true) {
                                  if (controller.mobilenumber.text.isNotEmpty) {
                                    controller.sendOtp();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Enter mobile number',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.black,
                                        fontSize: 14.0);
                                  }
                                }
                              },
                              child: const Text(
                                "REQUEST OTP",
                                style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal),
                              )),
                        )),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
