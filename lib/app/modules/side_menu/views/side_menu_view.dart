import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newuser/app/modules/home/controllers/home_controller.dart';
import 'package:newuser/app/modules/home/repo/home_repository.dart';
import 'package:newuser/app/modules/side_menu/repo/side_menu_repository.dart';
import 'package:newuser/app/modules/side_menu/views/help_view.dart';
import 'package:newuser/app/routes/app_pages.dart';
import 'package:newuser/app/service/provider.dart';
import 'package:newuser/app/widgets/exit_dialog.dart';

import '../controllers/side_menu_controller.dart';

class SideMenuView extends GetView<SideMenuController> {
  const SideMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController =
        Get.put(HomeController(HomeRepository(provider: Provider())));
    final controller =
        Get.put(SideMenuController(SideMenuRepository(provider: Provider())));
    return Container(
      height: Get.height,
      width: Get.width / 1.5,
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: Get.width,
                        color: Colors.white,
                      ),
                      Container(
                        height: 100,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                  Positioned(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.PROFILE);
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  )),
                  Positioned(
                    top: 30,
                    left: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 120,
                            child: Text(
                              homeController.name.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Robotic'),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: SizedBox(
                              width: 120,
                              child: Text(
                                homeController.email.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Robotic'),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              shape: BoxShape.circle),
                          height: 120,
                          width: 120,
                        ),
                        Positioned(
                          left: 5,
                          top: 5,
                          child: controller.image == 'true'
                              ? CircleAvatar(
                                  maxRadius: 55,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://india.taxideals.online/driver-photo/id/PROFILE/${controller.id}',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  "assets/userr.png",
                                  height: 120,
                                ),
                        )
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 150,
                    left: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Credit Amount",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Robotic'),
                        ),
                        Text(
                          "CASH",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Robotic'),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 150,
                    left: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet Balance",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Robotic'),
                        ),
                        Text(
                          "CASH",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Robotic'),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.wallet, color: Colors.grey.shade400),
            title: const Text('Wallet'),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.history, color: Colors.grey.shade400),
            title: const Text('My Trips'),
            onTap: () {
              controller.tripHistory();
              Get.toNamed(Routes.MYTRIP);
            },
          ),
          ListTile(
            dense: true,
            trailing: Icon(Icons.favorite, color: Colors.grey.shade400),
            title: const Text('Favorite'),
            onTap: () {},
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(
              Icons.settings,
              color: Colors.grey.shade400,
            ),
            title: const Text('Settings'),
            onTap: () {
              Get.toNamed(Routes.SETTINGS);
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.help, color: Colors.grey.shade400),
            title: const Text('Help'),
            onTap: () {
              Get.back();
              Get.dialog(const HelpView());
              // Get.toNamed(Routes.HELP);
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.rate_review, color: Colors.grey.shade400),
            title: const Text('Rate Us'),
            onTap: () {
              Get.toNamed(Routes.RATEUS);
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.feedback, color: Colors.grey.shade400),
            title: const Text('Feedback'),
            onTap: () {
              Get.toNamed(Routes.FEEDBACK);
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.share, color: Colors.grey.shade400),
            title: const Text('Share'),
            onTap: () {
              controller.shareFile();
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.info, color: Colors.grey.shade400),
            title: const Text('About'),
            onTap: () {
              Get.toNamed(Routes.ABOUT);
            },
          ),
          ListTile(
            visualDensity: const VisualDensity(vertical: -3),
            dense: true,
            trailing: Icon(Icons.logout, color: Colors.grey.shade400),
            title: const Text('Log Out'),
            onTap: () {
              showLogoutPopup(context);
            },
          ),
        ],
      ),
    );
  }
}
