import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newuser/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            height: Get.height / 1.4,
            width: Get.width,
            child: PageView.builder(
              padEnds: false,
              pageSnapping: true,
              allowImplicitScrolling: false,
              controller: controller.controller1,
              scrollDirection: Axis.horizontal,
              itemCount: controller.welcomes.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height / 2.4,
                      width: Get.width,
                      child: Image.asset(
                        controller.welcomes[index]["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        controller.welcomes[index]["title"],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10),
                      child: Text(
                        controller.welcomes[index]["text"],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: controller.controller1,
                  count: controller.welcomes.length,
                  effect: ScrollingDotsEffect(
                    dotColor: Colors.grey.shade600,
                    activeDotColor: Colors.black,
                    dotHeight: 14,
                    dotWidth: 14,
                    radius: 10,
                    fixedCenter: false,
                    activeDotScale: 1,
                    maxVisibleDots: 5,
                    activeStrokeWidth: 14,

                    // jumpScale: .7,
                    // verticalOffset: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Container(
                          height: 100,
                          width: Get.width / 2.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black),
                          child: const Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.key,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Container(
                          height: 100,
                          width: Get.width / 2.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red),
                          child: const Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_add_alt,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
