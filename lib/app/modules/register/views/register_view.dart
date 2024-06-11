import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:newuser/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: Get.height / 2,
                width: Get.width,
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Get.offNamedUntil(Routes.LOGIN, (route) => false);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.amber,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                          child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset("assets/register_img.png"))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Register with your mobile\n               number",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            emptySearchBuilder: (context) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 15),
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
                            width: Get.width / 1.6,
                            height: 45,
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
                                  controller.error.value = 'Not valid number';
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
                    )
                  ],
                ),
              ),
              Obx(
                () => Padding(
                    padding: EdgeInsets.only(
                        top: Get.height / 4, left: 30, right: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: controller.err.value == true
                              ? Colors.amber
                              : Colors.grey),
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
                            style: TextStyle(color: Colors.white),
                          )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
