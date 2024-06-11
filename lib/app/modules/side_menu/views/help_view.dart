// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newuser/app/modules/side_menu/controllers/side_menu_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends GetView<SideMenuController> {
  const HelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 80, left: 16, right: 16),
                      height: 80,
                      width: Get.width,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 160, left: 16, right: 16),
                          height: Get.height / 1.4,
                          width: Get.width,
                          color: Colors.black.withOpacity(0.4),
                          child: Column(
                            children: [
                              SizedBox(
                                // height: 40,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 80),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        // margin: const EdgeInsets.only(left: 20, top: 15),
                                        height: 2,
                                        width: 80,
                                        color: Colors.amber,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 0, left: 10, right: 10),
                                        child: Text(
                                          "Help",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24),
                                        ),
                                      ),
                                      Container(
                                        // margin: const EdgeInsets.only(left: 14, top: 15),
                                        height: 2,
                                        width: 80,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse('https://taxideals.in/'),
                                    mode: LaunchMode.inAppBrowserView,
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 65),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                            "assets/earth.png",
                                            color: Colors.white,
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Kerala Cabs Web",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final Uri emailUri = Uri(
                                    scheme: 'mailto',
                                    path: '',
                                    queryParameters: {},
                                  );

                                  final String emailUrl = emailUri.toString();
                                  if (await canLaunch(emailUrl)) {
                                    await launch(emailUrl);
                                  } else {
                                    throw 'Could not launch $emailUrl';
                                  }
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 65),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                            "assets/email.png",
                                            color: Colors.white,
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(left:10),
                                        child: Text(
                                          "Support mail",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch("tel://91953735313");
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 65),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                            "assets/smartphone.png",
                                            color: Colors.white,
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Mobile Support",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse(
                                        'https://facebook.com/kerala.cabs.31'),
                                    mode: LaunchMode.inAppBrowserView,
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 65),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                            "assets/facebook.png",
                                            color: Colors.white,
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Facebook",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launchUrl(
                                    Uri.parse(
                                        'https://twitter.com/KeralaCabs2?s=29'),
                                    mode: LaunchMode.inAppBrowserView,
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 65),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Image.asset(
                                            "assets/twitter.png",
                                            color: Colors.white,
                                          )),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Twitter",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                          margin: EdgeInsets.only(left: 90,right:90,top: 70),
                                height: 65,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.amber
                                    // color: controller.forgotPassword.text.isNotEmpty
                                    //     ? Colors.amber
                                    //     : Colors.transparent
                                    ),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                  
                                    },
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 100,
                            left: 135,
                            child: Image.asset(
                              "assets/hand.png",
                              height: 120,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
