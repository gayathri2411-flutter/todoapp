
// ignore_for_file: avoid_print, unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newuser/app/modules/home/model/submit_rating_request.dart';
import 'package:newuser/app/service/rating_provider.dart';
import 'package:newuser/app/widgets/shared_functions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class PushNotificationService {
    
  static final _notification = FlutterLocalNotificationsPlugin();

  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      firebaseMessagingBackgroundHandler(message);
      print(
          'Got a message whilst in the foreground! idfen : ${message.toMap()}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
// This function is called when ios app is opened, for android case `onDidReceiveNotificationResponse` function is called
    FirebaseMessaging.onMessageOpenedApp.listen(
          (RemoteMessage message) {
        print('Got a message while opened the app');

        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
        FirebaseMessaging.onBackgroundMessage(
            firebaseMessagingBackgroundHandler);

        // notificationRedirect(message.data[keyTypeValue], message.data[keyType]);
      },
    );

    // enableIOSNotifications();
    await registerNotificationListeners();
  }

  Future<void> registerNotificationListeners() async {
    final AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOSSettings =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initSettings =
    InitializationSettings(android: androidSettings, iOS: iOSSettings);

    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
// We're receiving the payload as string that looks like this
// {buttontext: Button Text, subtitle: Subtitle, imageurl: , typevalue: 14, type: course_details}
// So the code below is used to convert string to map and read whatever property you want
        final List<String> str =
        details.payload!.replaceAll('{', '').replaceAll('}', '').split(',');
        final Map<String, dynamic> result = <String, dynamic>{};
        for (int i = 0; i < str.length; i++) {
          final List<String> s = str[i].split(':');
          result.putIfAbsent(s[0].trim(), () => s[1].trim());
        }
        // notificationRedirect(result[keyTypeValue], result[keyType]);
      },
    );
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      // consoleLog(message, key: 'firebase_message');
      final RemoteNotification? notification = message!.notification;
      final AndroidNotification? android = message.notification?.android;
// If `onMessage` is triggered with a notification, construct our own
// local notification to show to users using the created channel.
    });
  }

  AndroidNotificationChannel androidNotificationChannel() =>
      const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
        'This channel is used for important notifications.', // description
        importance: Importance.max,
      );
  Future initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}

Future showNotification(RemoteMessage message) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id', 'your channel name',
      importance: Importance.max, priority: Priority.high, showWhen: false);
  // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    // iOS: iOSPlatformChannelSpecifics
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification!.title,
    message.notification!.body,
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  return showDialog(
      useSafeArea: true,
      context: (Get.context!),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: Stack(
            children: [
              SizedBox(
                height: Get.height / 2.5,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/car.png",
                        height: 70,
                      ),
                      const Divider(
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        message.notification!.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        message.notification!.body!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Phone Number : ${message.data["mobile"]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Your Otp : ${message.data["otp"]}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Distance : ${message.data["km"]} Km",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          makePhoneCall(message.data["mobile"]);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.cancel_outlined,color: Colors.white,),
                  onPressed: () {
                    Navigator.pop(context);

                  },
                ),
              ),
            ],
          ),
        );
      })
      .then((value) => {
    print("Calsssss"),
  })
      .catchError((e) {
    print(("the rrro : $e"));
    return e;
  });
}

Future pickupStarted() async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id', 'your channel name',
      importance: Importance.max, priority: Priority.high, showWhen: false);
  // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    // iOS: iOSPlatformChannelSpecifics
  );
  return showDialog(
      useSafeArea: true,
      context: (Get.context!),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: Get.height / 2,
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
                boxShadow: const [BoxShadow(blurRadius: 6)]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset("assets/icon_user.png"),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width / 7,
                      child: const Divider(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text("Pickup Done",
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(
                      width: 6,
                    ),
                    SizedBox(
                      width: Get.width / 7,
                      child: const Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.car_repair_outlined),
                    Text("Are You in shall we start",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                MaterialButton(
                  onPressed: () {
                    // Get.back();
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: Get.width / 4,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Future rateRide(RemoteMessage message) {
  RxInt ratingValue = 0.obs;
  var reviewController = TextEditingController();
  submitRating() async {
    RatingProvider ratingProvider = RatingProvider();
    SubmitRatingRequest request = SubmitRatingRequest();
    request.comment = reviewController.text;
    request.rating = ratingValue.value;
    request.updatedOn = Jiffy.now().format();
    request.formattedDate = Jiffy.now().format();
    request.taxiDetailId = message.data["driverId"];
    request.rideId = message.data["tripId"];
    request.driverId = message.data["driverId"];
    request.postedBy = profileDetails.current["firstName"];
    request.userFullName = profileDetails.current["firstName"];
    request.userId = profileDetails.current["id"];
    ratingProvider.submitRating(request: request).then((value) => {
      toastify("Thanks for your rating"),
    });
  }

  return showDialog(
      context: Get.context!,
      builder: (context) {
        return Dialog(
          child: Container(
            height: Get.height / 1.8,
            width: Get.width,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Ride finished",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: Colors.amber,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("From : "),
                      SizedBox(
                        width: Get.width / 2.2,
                        child: Text(
                          message.data["sourceAddress"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("To : "),
                      SizedBox(
                        width: Get.width / 2.2,
                        child: Text(
                          message.data["destinationAddress"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Type : "),
                      Text(
                        "Cash",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("KM : "),
                      Text(
                        "${double.parse(message.data["km"]).round()} km",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Approximate Price : "),
                      Text(
                        "${double.parse(message.data["price"].toString()).round()}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Divider(
                    color: Colors.amber,
                  ),
                  Obx(() => Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        IconButton(
                            onPressed: () {
                              ratingValue.value = i + 1;
                            },
                            icon: Icon(
                              Icons.star_outlined,
                              color: i < ratingValue.value
                                  ? Colors.amber
                                  : Colors.grey,
                            ))
                    ],
                  )),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 40,
                    width:200,
                    child: TextField(
                      controller: reviewController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Please enter your valuable feedback  "),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MaterialButton(
                    onPressed: () {
                      submitRating();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
