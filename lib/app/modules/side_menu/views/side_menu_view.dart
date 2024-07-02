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
    final homeController = Get.put(HomeController(HomeRepository(provider: Provider())));
    final controller = Get.put(SideMenuController(SideMenuRepository(provider: Provider())));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text('Menu', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 16.0), // Space between AppBar and profile container
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0), // Margin to adjust horizontal spacing
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      controller.image == 'true'
                          ? CircleAvatar(
                        maxRadius: 25,
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
                        height: 50,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            homeController.name.toString(),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            homeController.email.toString(),
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.PROFILE);
                          },
                          icon: const Icon(Icons.edit,color: Colors.blue,))
                    ],
                  ),
                  Divider(height: 20, thickness: 1, color: Colors.grey[300]),
                  const Row(
                    children: [
                      Icon(Icons.credit_card,color: Colors.blue,size: 25),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            "Credit Amount",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Robotic'),
                          ),
                          Text(
                            "CASH",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Robotic'),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.wallet,color: Colors.blue,size: 25),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            "Wallet Balance",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Robotic'),
                          ),
                          Text(
                            "CASH",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Robotic'),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              leading: Icon(Icons.wallet, color: Colors.blue),
              dense: true,
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('Wallet', style: TextStyle(fontSize: 15)),
              onTap: () {},
            ),
            Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(Icons.directions_car, color: Colors.blue),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('My Rides',style: TextStyle(fontSize: 15)),
              onTap: () {
                controller.tripHistory();
                Get.toNamed(Routes.MYTRIP);
              },
            ),
            Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(
                  Icons.settings,
                  color: Colors.blue
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('Settings',style: TextStyle(fontSize: 15)),
              onTap: () {
                Get.toNamed(Routes.SETTINGS);
              },
            ),
            Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(Icons.help, color: Colors.blue),
              title: Text('Help',style: TextStyle(fontSize: 15)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              onTap: () {
                Get.to(HelpView());
              },
            ),
          Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(Icons.rate_review,color: Colors.blue),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('Rate Us',style: TextStyle(fontSize: 15)),
              onTap: () {
                Get.toNamed(Routes.RATEUS);
              },
            ),
            Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(Icons.feedback, color: Colors.blue),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('Feedback',style: TextStyle(fontSize: 15)),
              onTap: () {
                Get.toNamed(Routes.FEEDBACK);
              },
            ),
            Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(Icons.share, color: Colors.blue),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('Share',style: TextStyle(fontSize: 15)),
              onTap: () {
                controller.shareFile();
              },
            ),
            Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(Icons.info, color: Colors.blue),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('About',style: TextStyle(fontSize: 15)),
              onTap: () {
                Get.toNamed(Routes.ABOUT);
              },
            ),
            Divider(height: 22, thickness: 1, color: Colors.grey[300],),
            ListTile(
              visualDensity: const VisualDensity(vertical: -3),
              dense: true,
              leading: Icon(Icons.logout, color: Colors.blue),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              title: const Text('Log Out',style: TextStyle(fontSize: 15)),
              onTap: () {
                showLogoutPopup(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
