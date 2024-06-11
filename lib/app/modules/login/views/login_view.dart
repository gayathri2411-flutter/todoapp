import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newuser/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/ic_launcher_foreground.png",
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 65,
                    child: TextFormField(
                      controller: controller.emailOrphone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email Or Mobile Number';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      onChanged: (v) {
                        controller.number.value = true;
                        controller.password.value = false;
                      },
                      onTap: () {
                        controller.number.value = true;
                        controller.password.value = false;
                      },
                      focusNode: controller.focusNode1,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          isDense: true,
                          enabled: true,
                          label: Text(
                            'Enter Your Email or Mobile Number',
                            style: TextStyle(
                                color: controller.number.value
                                    ? Colors.amber
                                    : Colors.black,
                                fontSize: 14),
                          ),
                          // errorBorder: const OutlineInputBorder(
                          //     borderSide:
                          //         BorderSide(color: Colors.red, width: 2)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 65,
                    child: TextFormField(
                      controller: controller.loginPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      enabled: true,
                      onChanged: (v) {},
                      onTap: () {
                        controller.number.value = false;
                        controller.password.value = true;
                      },
                      obscureText: controller.pass.value,
                      focusNode: controller.focusNode2,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                          floatingLabelStyle:
                              const TextStyle(color: Colors.red),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: GestureDetector(
                              onTap: () {
                                if (controller.pass.value == false) {
                                  controller.pass.value = true;
                                } else {
                                  controller.pass.value = false;
                                }
                              },
                              child: Icon(
                                controller.pass.value == false
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,
                                color: Colors.black,
                              )),
                          isDense: true,
                          enabled: true,
                          label: Text(
                            'Password',
                            style: TextStyle(
                                color: controller.password.value
                                    ? Colors.amber
                                    : Colors.black,
                                fontSize: 14),
                          ),
                         
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber),
                    child: TextButton(
                        onPressed: () {
                          // Get.toNamed(Routes.HOME);
                          final form =
                              controller.formKey.currentState!.validate();
                          if (form == true) {
                            controller.login();
                          }
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                  )),
              const Center(child: Text("Connect with")),
              Center(
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.FORGOT_PASSWORD);
                      },
                      child: const Text(
                        "Forgot Passeword?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member yet?",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12)),
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))),
                ],
              ),
            ],
          ),
        ));
  }
}
