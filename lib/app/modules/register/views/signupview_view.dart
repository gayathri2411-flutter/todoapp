import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newuser/app/modules/register/controllers/register_controller.dart';
import 'package:newuser/app/routes/app_pages.dart';

class SignupviewView extends GetView<RegisterController> {
  const SignupviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: controller.formKey2,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                  child: Text(
                "Signup",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 65,
                    width: Get.width / 1.2,
                    child: TextFormField(
                      controller: controller.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          hintText: 'Name',
                          contentPadding: EdgeInsets.only(top: 25, right: 2),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 65,
                    width: Get.width / 1.2,
                    child: TextFormField(
                      controller: controller.email,
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value ?? "");
                        if (value!.isEmpty) {
                          return "Email is required";
                        } else if (emailValid == false) {
                          return "Email should be valid";
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          hintText: 'Enter your email id',
                          contentPadding: EdgeInsets.only(top: 25, right: 2),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Icon(
                    Icons.key,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 65,
                      width: Get.width / 1.2,
                      child: TextFormField(
                        controller: controller.password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password atleast six character';
                          } else {
                            return null;
                          }
                        },
                        obscureText: controller.visible.value,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            suffixIcon: controller.visible.value
                                ? GestureDetector(
                                    onTap: () {
                                      controller.visible.value = false;
                                    },
                                    child: const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ))
                                : GestureDetector(
                                    onTap: () {
                                      controller.visible.value = true;
                                    },
                                    child: const Icon(Icons.visibility,
                                        color: Colors.black)),
                            hintText: 'Password',
                            contentPadding:
                                const EdgeInsets.only(top: 25, right: 2),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  child: Icon(
                    Icons.call,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 50,
                    width: Get.width / 1.2,
                    child: TextFormField(
                      readOnly: true,
                      obscureText: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: controller.mobilenumber.text,
                          contentPadding:
                              const EdgeInsets.only(top: 25, right: 2),
                          border: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Obx(
                      () => Checkbox(
                        side: BorderSide(
                            color: controller.acceptTearms.value
                                ? Colors.black
                                : Colors.red,
                            width: 2),
                        activeColor: Colors.black,
                        value: controller.accept.value,
                        onChanged: (value) {
                          controller.accept.value = value!;
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Accept terms & conditions",
                      style: TextStyle(
                          color: controller.acceptTearms.value
                              ? Colors.black
                              : Colors.red,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  )
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
                        controller.acceptTearms.value = controller.accept.value;
                        final form =
                            controller.formKey2.currentState!.validate();
                        if (form == true &&
                            controller.acceptTearms.value == true) {
                          controller.signUp();
                        } else {}
                      },
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I am already a member !!!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
