import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends GetView {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'About',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
          ),
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/bg_blur.png",
                    ),
                    fit: BoxFit.cover)),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: SizedBox(
                      width: Get.width,
                      child: const Text(
                        "The Keralacabs was started in 2007. The booking app was founded using services like tracking and booking the Taxi and cabs, as well as the mobile request acceptance features. An airport may determine prices or organize different qualities and prices.",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        overflow: TextOverflow.clip,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: Get.height / 3),
                  child: GestureDetector(
                    onTap: () {
                      launchUrl(
                        Uri.parse('https://www.taxideals.in/search-home'),
                        mode: LaunchMode.inAppWebView,
                      );
                    },
                    child: const SizedBox(
                      height: 40,
                      child: Text(
                        "https://www.taxideals.in/search-home",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
