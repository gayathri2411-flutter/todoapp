import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newuser/app/modules/side_menu/controllers/side_menu_controller.dart';
import 'package:newuser/app/modules/side_menu/repo/side_menu_repository.dart';
import 'package:newuser/app/service/provider.dart';

class ProfileView extends GetView<SideMenuController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller =
    Get.put(SideMenuController(SideMenuRepository(provider: Provider())));

    return SafeArea(
      child: Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bg_blur.png"),
                            fit: BoxFit.cover)),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 80, left: 16, right: 16),
                    height: 80,
                    width: Get.width,
                    color: Colors.blueGrey.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 77),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            width: Get.width / 3.5,
                            color: Colors.white,
                          ),
                          Container(
                            height: 1,
                            width: Get.width / 3.5,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin:
                        const EdgeInsets.only(top: 160, left: 16, right: 16),
                        height: Get.height / 1.5,
                        width: Get.width,
                        color: Colors.black.withOpacity(0.6),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();
                                      final XFile? image = await picker.pickImage(source: ImageSource.camera);
                                      if (image != null) {
                                        controller.uploadImage1(File(image.path));
                                      }
                                    },
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();
                                      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                      if (image != null) {
                                        controller.uploadImage(File(image.path));
                                      }
                                    },
                                    child: Icon(
                                      Icons.photo_size_select_actual_outlined,
                                      size: 30,
                                      color: Colors.amber,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              // height: 40,
                              width: Get.width,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                      const EdgeInsets.only(left: 5, top: 15),
                                      height: 2,
                                      width: 90,
                                      color: Colors.amber,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 8.0, left: 10),
                                      child: Text(
                                        "Profile Picture",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                      const EdgeInsets.only(left: 14, top: 15),
                                      height: 2,
                                      width: 80,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Your Name",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(),
                                style: TextStyle(color: Colors.white),
                                controller: controller.name,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mail_outline,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Your Email",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                controller: controller.email,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.mobile_friendly,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Your Mobile Number",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 16, right: 16),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: controller.mobile,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                  height: 45,
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
                                        controller.updateProfile();
                                      },
                                      child: const Text(
                                        "UPDATE",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      )),
                                )),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 120,
                        child: controller.image == 'true'
                            ? CircleAvatar(
                          maxRadius: 60,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: 'https://india.taxideals.online/driver-photo/id/PROFILE/${controller.id}',
                                fit: BoxFit.fill,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        )
                            : Image.asset(
                          "assets/userr.png",
                          height: 120,
                        ),
                      ),



                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}