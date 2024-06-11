import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newuser/app/modules/side_menu/controllers/side_menu_controller.dart';
import 'package:newuser/app/modules/side_menu/repo/side_menu_repository.dart';
import 'package:newuser/app/routes/app_pages.dart';
import 'package:newuser/app/service/provider.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Do you want to exit an App?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return false when click on "NO"
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              //return true when click on "Yes"
              child: const Text('Yes'),
            ),
          ],
        ),
      ) ??
      false; //if showDialouge had returned null, then return false
}

Future<bool> showLogoutPopup(context) async {
  return await showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Do you want to exit an App?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return false when click on "NO"
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                final controller = Get.put(SideMenuController(
                    SideMenuRepository(provider: Provider())));
                controller.logout();
              },
              //return true when click on "Yes"
              child: const Text('Yes'),
            ),
          ],
        ),
      ) ??
      false; //if showDialouge had returned null, then return false
}
