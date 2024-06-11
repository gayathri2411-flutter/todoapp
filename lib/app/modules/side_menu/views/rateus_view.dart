import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:newuser/app/modules/side_menu/controllers/side_menu_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class RateusView extends GetView<SideMenuController> {
  const RateusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => Container(
          decoration: const BoxDecoration(color: Color(0XFF3A3B3C)),
          height: controller.visibile.value == true
              ? Get.height / 1.6 + 23
              : Get.height / 2.2,
          width: Get.width,
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset(
                          "assets/back_arrow.PNG",
                          height: 25,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          minRadius: 60,
                          maxRadius: 65,
                          backgroundImage: AssetImage("assets/bg_blur.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Image.asset(
                            "assets/like.png",
                            height: 90,
                            width: 90,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 2,
                      width: 100,
                    ),
                    const Text(
                      "Rate Us",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    Container(
                      color: Colors.amber,
                      height: 2,
                      width: 100,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    unratedColor: Colors.grey,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.rating.value = rating;
                    },
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.visibile.value,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Center(
                          child: Text(
                            "Awesome! Thank you for rating us.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Center(
                          child: Text(
                            "Please help others, in knowing some good things \n                             about this app.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 25, right: 25),
                          child: Container(
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.amber),
                            child: TextButton(
                                onPressed: () async {
                                  launchUrl(Uri.parse(
                                      "https://play.google.com/store/apps/details?id=com.mongokerala.taxi.newuser"));
                                },
                                child: const Text(
                                  "RATE US ON PLAY STORE",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.visibile.value = false;
                        Get.back();
                      },
                      child: const Text(
                        "LATER",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.visibile.value == false,
                        child: TextButton(
                          onPressed: () {
                            if (controller.rating.value >= 1.0) {
                              controller.visibile.value = true;
                            } else {
                              controller.visibile.value = false;
                            }
                          },
                          child: const Text(
                            "SUBMIT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
