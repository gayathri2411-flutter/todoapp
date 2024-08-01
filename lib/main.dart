// ignore_for_file: unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newuser/app/widgets/network_checker.dart';
import 'package:newuser/app/widgets/profile_details.dart';
import 'package:newuser/app/widgets/push_notification_service.dart';
import 'package:newuser/app/widgets/ride_status.dart';
import 'package:newuser/app/widgets/shared_functions.dart';
import 'package:newuser/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'package:get_it/get_it.dart';
import 'package:connection_notifier/connection_notifier.dart';
// import 'firebase_options.dart';

//old one --> android:value="AIzaSyDkCytxQTkidI9IkQmXRrnB9SPX1HeVbm4"
//New one --> AIzaSyCF6-zr1vLauV0u3QoAGxPkGpEM1hX1Fnc
GetIt getIt = GetIt.instance;
String fcmToken =
    "AAAAULZrc0g:APA91bHr0rtn_N3Yd_t_MUPFk9oj9MqNVYnHbQbJdGP-o4t2hqUT83iZ-WSX5Vs772RCdygDDNMRpt-L2fiTWwriuoGGvuYItz5Pwmi3Tz9x-NOGx5YOdm2I_aJKYGJSHgpdvEasiM85";
FirebaseMessaging? firebaseMessaging;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
final bookride = getIt.get<BookRide>();
final profileDetails = getIt.get<ProfileDetails>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  firebaseMessaging = FirebaseMessaging.instance;
  await PushNotificationService().setupInteractedMessage();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await firebaseMessaging!.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  final settings = await firebaseMessaging!.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  await GetStorage.init();
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  getIt.registerSingleton<ProfileDetails>(ProfileDetails());
  getIt.registerSingleton<BookRide>(BookRide());
  bookride.setStatus(0);
  runApp(
    ConnectionNotifier(
      disconnectedContent: const NoInterNetWidget(),
      // connectionNotificationOptions: const ConnectionNotificationOptions(
      //   overlayAnimationType: OverlayAnimationType.slide,
      //   disconnectedConnectionNotification: NoInterNetWidget(),
      // ),
      child: GetMaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("calsssss");
  print("the message is : ${message.data["rideStatus"] == 1}");
  if (message.data["rideStatus"] == "1") {
    debugPrint("the ride stauts is 1");
    bookride.setStatus(2);
    showNotification(message);
  }
  else if (message.data["rideStatus"] == "2") {
    debugPrint("the ride stauts is 2 ");
    debugPrint("itsss worksss");
    bookride.setStatus(2);

    pickupStarted();
  }
  else if (message.data["rideStatus"].toString() == "3") {
    debugPrint("the ride stauts is 3");
    rateRide(message);
  } else {
    debugPrint("the ride stauts is cancelled");
    bookride.setStatus(2);
    toastify("Your Ride was Cancelled");
  }

  _showFullScreenNotification().then((value) => {
    debugPrint("the backgroundd value is :"),
    debugPrint('Handling a background message ${message.messageId}'),
  });
  print("Handling a background message: ${message.messageId}");
}

Future<void> _showFullScreenNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
      'your other channel id', 'your other channel name',
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      priority: Priority.high,
      importance: Importance.high,
      fullScreenIntent: true);

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    // android: androidPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
      0,
      'custom sound notification title',
      'custom sound notification body',
      platformChannelSpecifics);
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);