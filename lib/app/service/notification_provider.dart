import 'dart:convert';

import 'package:get/get.dart';
import 'package:newuser/app/service/api_end_points.dart';
import 'package:newuser/main.dart';

class NotificationProvider extends GetConnect{
  Future requestNotification(request) async{
    try {
      await post(ApiEndPoints.fcmToken, jsonEncode(request),headers: {
        "Content-Type":"application/json",
        "Authorization":"key=$fcmToken"
      });
    } catch (exception) {
      rethrow;
    }
  }
}