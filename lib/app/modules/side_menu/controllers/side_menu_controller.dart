// ignore_for_file: body_might_complete_normally_catch_error, unnecessary_overrides

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newuser/app/modules/home/controllers/home_controller.dart';
import 'package:newuser/app/modules/home/repo/home_repository.dart';
import 'package:newuser/app/modules/side_menu/model/feedback_request.dart';
import 'package:newuser/app/modules/side_menu/model/profile_update_request.dart';
import 'package:newuser/app/modules/side_menu/model/trip_history_response.dart';
import 'package:newuser/app/modules/side_menu/repo/side_menu_repository.dart';
import 'package:newuser/app/routes/app_pages.dart';
import 'package:newuser/app/service/image_upload_service.dart';
import 'package:newuser/app/service/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
import 'package:flutter_share/flutter_share.dart';

class SideMenuController extends GetxController {
  final SideMenuRepository repo;
  SideMenuController(this.repo);
  RxDouble rating = 0.0.obs;
  RxBool visibile = false.obs;

  final feedback = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  var image;
  var id;
  Rx<XFile?> pickedFile = Rx<XFile?>(null);
  Rx<CroppedFile?> croppedFile = Rx<CroppedFile?>(null);

  TripHistoryResponse? tripData;
  RxBool tripLoading = false.obs;
  final homeController =
      Get.put(HomeController(HomeRepository(provider: Provider())));
  @override
  void onInit() {
    super.onInit();
    name.text = homeController.name;
    email.text = homeController.email;
    mobile.text = homeController.number;
    image = homeController.image;
    id = homeController.id;
    print(id);
    print(image);
  }

  Future<void> shareFile() async {
    // List<dynamic> docs = await DocumentsPicker.pickDocuments;
    // if (docs == null || docs.isEmpty) return null;
    await FlutterShare.share(
        title: 'Kerala Cabs User',
        text: 'Click on here to download and use Kerala Cabs User!!',
        linkUrl:
            'https://play.google.com/store/apps/details?id=com.mongokerala.taxi.newuser',
        chooserTitle: 'Click on here to download and use Wish It On!!');
  }

  Future<void> uploadImage(File image) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      pickedFile.value = picked;
      await cropImage(pickedFile.value);
    }
  }  Future<void> uploadImage1(File image) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked != null) {
      pickedFile.value = picked;
      await cropImage(pickedFile.value);
    }
  }

  Future<void> cropImage(
    XFile? pickedFile,
  ) async {
    if (pickedFile != null) {
      final croppedFileValue = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '',
            dimmedLayerColor: Colors.black,
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.amber,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            activeControlsWidgetColor: Colors.amber,
          ),
          IOSUiSettings(
            title: '',
          ),
          WebUiSettings(
            context: Get.context!,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );

      if (croppedFileValue != null) {
        print(homeController.name);

        croppedFile.value = croppedFileValue;
        ImageUploadService().uploadFile(
            File(croppedFile.value!.path.toString()), name.text, 'String', id);
      }
    }
  }

  void tripHistory() async {
    tripLoading.value = true;
    await repo
        .tripHistory()
        .then((value) => {
              if (value.status == true)
                {
                  tripData = value,
                  tripLoading.value = false,
                }
              else
                {
                  tripLoading.value = false,
                }
            })
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0);
      debugPrint(e);
    });
  }

  void logout() async {
    await repo
        .logout()
        .then((value) => {
              if (value.status == true)
                {
                  GetStorage().erase(),
                  Get.offNamedUntil(Routes.LOGIN, (route) => false),
                }
              else
                {
                  tripLoading.value = false,
                  // Fluttertoast.showToast(
                  //     msg: value.message.toString(),
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.white,
                  //     textColor: Colors.black,
                  //     fontSize: 14.0)
                }
            })
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0);
      debugPrint(e);
    });
  }

  void feedBack() async {
    FeedBackRequest request = FeedBackRequest();
    String dateString = DateTime.now().toString();
    DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
    DateFormat outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

    DateTime dateTime = inputFormat.parse(dateString);
    String formattedDateString = outputFormat.format(dateTime);
    request.carType = "string";
    request.destination = "string";
    request.email = "taxideals.ch@gmail.com";
    request.endDate = formattedDateString;
    request.id = "0";
    request.job = "string";
    request.message = feedback.text;
    request.name = homeController.name.toString();
    request.phonenumber = homeController.number.toString();
    request.senderMail = homeController.email.toString();
    request.source = "string";
    request.startDate = formattedDateString;
    request.subject = "Feedback from USER - Android app";
    request.taxiId = "dummy";

    await repo
        .feedback(request: request)
        .then((value) => {
              if (value.status == true)
                {
                  if (value.message != null)
                    {
                      Fluttertoast.showToast(
                          msg: value.data.toString().replaceAll(':', ''),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 14.0),
                      Get.offNamedUntil(Routes.HOME, (route) => false)
                    },
                }
              else
                {
                  Fluttertoast.showToast(
                      msg: value.message.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 14.0)
                }
            })
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0);
      debugPrint(e);
    });
  }

  void getProfile() async {
    await repo
        .getProfile()
        .then((value) => {
              if (value.status == true)
                {
                  if (value.message != null) {},
                }
              else
                {
                  Fluttertoast.showToast(
                      msg: value.message.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 14.0)
                }
            })
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0);
      debugPrint(e);
    });
  }

  void updateProfile() async {
    if (croppedFile.value != null) {
      ImageUploadService().uploadFile(
          File(croppedFile.value!.path.toString()), name.text, 'PROFILE', id);
    }

    Profile_Update_Request request = Profile_Update_Request();

    request.address = "";
    request.carType = "string";
    request.category = "string";
    request.code = "";
    request.deviceId = "string";
    request.domain = "KERALACABS";
    request.email = email.text;
    request.firstName = name.text;
    request.id = id;
    request.lang = "string";
    request.lastName = "driver";
    request.latitude = "0";
    request.loginStatus = "string";
    request.longitude = "0";
    request.password = "string";
    request.phoneNumber = "9943657195";
    request.longitude = mobile.text;
    request.phoneVerified = "string";
    request.price = 0;
    request.restKey = "";
    request.role = "ROLE_USER";
    request.status = "string";
    request.status = "string";
    request.status = "KERALACABS";

    await repo
        .profileUpdate(request: request)
        .then((value) => {
              if (value.status == true)
                {
                  if (value.message != null)
                    {
                      Fluttertoast.showToast(
                          msg: value.data.toString().replaceAll(':', ''),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 14.0),
                      Get.offNamedUntil(Routes.HOME, (route) => false)
                    },
                }
              else
                {
                  Fluttertoast.showToast(
                      msg: value.message.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      fontSize: 14.0)
                }
            })
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0);
      debugPrint(e);
    });
  }
}
