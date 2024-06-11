import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newuser/app/modules/side_menu/controllers/side_menu_controller.dart';

class FeedbackView extends GetView<SideMenuController> {
  const FeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Color(0XFF3A3B3C)),
          height: Get.height / 1.8,
          width: Get.width,
          margin: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
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
                          "assets/cross.png",
                          height: 25,
                          color: Colors.amber,
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
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Image.asset(
                            "assets/satisfaction.png",
                            height: 70,
                            width: 70,
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
                      "Feed back",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Center(
                      child: Text(
                        "How do you feel about the support received?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 25, right: 25),
                      child: SizedBox(
                          height: 90,
                          width: Get.width,
                          child: TextField(
                            controller: controller.feedback,
                            cursorColor: Colors.grey,
                            style: TextStyle(
                                color: Colors.grey.shade100, height: 1),
                            decoration: InputDecoration(
                                focusColor: Colors.red,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2)),
                                hintText: 'Type your feed back here...',
                                hintStyle: TextStyle(
                                    color: Colors.grey.shade100,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                            maxLines: 10,
                          ))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
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
                    TextButton(
                      onPressed: () {
                        if (controller.feedback.text.isNotEmpty) {
                          controller.feedBack();
                        }
                      },
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
