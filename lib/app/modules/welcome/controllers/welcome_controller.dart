// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  // ignore:
  @override
  void onInit() {
    super.onInit();
  }

  final controller1 = PageController(viewportFraction: 1, keepPage: true);

  RxList welcomes = [
    {
      "image": 'assets/routemap.png',
      'title': 'KERALA CABS USER',
      'text':
          'Using this application one driver can easily\nget their business in hands.  And they are the\nowner of their business they can schedule their own time'
    },
    {
      "image": 'assets/getcar.png',
      'title': 'DIRECTION',
      'text':
          'Easier to use and more reliable, the app now\nsupports you--like a partner--at every turn.\nyou can easily get a customer destination'
    },
    {
      "image": 'assets/security.png',
      'title': 'SMART PAY',
      'text':
          'The new Driver app helps you earn good\nwith real-time information and you can\ndecide your own time for your business'
    },
    {
      "image": 'assets/cardless.png',
      'title': 'BUILD FOR YOU',
      'text':
          'We associated with drivers and delivery\npartners around the world to build a new app'
    }
  ].obs;
}
