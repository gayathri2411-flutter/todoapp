import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newuser/app/modules/home/mapUtils/mapUtils.dart';
import 'package:newuser/app/modules/home/model/place_response.dart';
import 'package:newuser/app/modules/home/views/locationSearch.dart';
import 'package:newuser/app/modules/side_menu/views/side_menu_view.dart';
import 'package:newuser/main.dart';
import '../../../widgets/loaders.dart';
import '../controllers/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class TaxiData {
  final double? latitude;
  final double? longitude;
  final String? carType;
  TaxiData({this.latitude, this.longitude, this.carType});
}
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  Future<void> bookingDetails(carDetails) {
    return showDialog(
        context: (Get.context!),
        builder: (context) {
          return StreamBuilder(
              stream: bookride.stream,
              builder: (context, rideStatus) {
                if (rideStatus.data == 2) {
                  Navigator.pop(context);
                }
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                      child: Container(
                        height: Get.height / 2.0,
                        width: Get.width,
                        margin: const EdgeInsets.only(left: 32, right: 32),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [BoxShadow(blurRadius: 6)]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, left: 12, right: 16),
                          child: Column(
                            children: [
                              const Text(
                                "Booking Detail's",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Divider(
                                color: Colors.amber,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Source : "),
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                      controller.sourceAddress.value,
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
                                  const Text("Destination : "),
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                      controller.destinationAddress.value,
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
                                children: [
                                  Text("Payment Type : "),
                                  Text(
                                    " Cash",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text("Car Type : "),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  Text(
                                    "${carDetails["carType"]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Divider(
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Requesting An Order please confirm your detail's",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller
                                          .bookRide(carDetails)
                                          .then((value) => {
                                        if (value == true)
                                          {
                                            Navigator.pop(context),
                                          }
                                      });
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: rideStatus.data == 1
                                              ? spinKitLoader()
                                              : const Text(
                                            "Confirm",
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                  visible: rideStatus.data == 1,
                                  child: Column(
                                    children: [
                                      LoadingAnimationWidget.beat(
                                        color: Colors.black,
                                        size:30
                                      ),
                                      SizedBox(height: 5,),
                                      const Text(
                                        "waiting for driver's response",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      )),
                );
              });
        });
  }
  Widget cabsList() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Get.height / 5,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        width: Get.width,
        child: Center(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.cabList.data!.length,
              itemBuilder: (c, i) {
                var details = controller.cabList.data![i];
                return MaterialButton(
                  onPressed: () {
                    debugPrint(
                        "theee detaills : ${controller.cabList.data![i].toJson()}");
                    bookride.setStatus(0);
                    bookingDetails(controller.cabList.data![i].toJson());
                  },
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 12.0, bottom: 32, left: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              details.carType!.toLowerCase().contains("auto")
                                  ? "assets/auto_copy.png"
                                  : "assets/logo.png",
                              height: 40,
                              width: 40,
                            ),
                            Text(
                              details.name!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            details.phoneNumber != null
                                ? Text(details.phoneNumber!)
                                : const SizedBox(),
                            details.carType != null
                                ? Text(
                              details.carType!,
                              style: const TextStyle(color: Colors.grey),
                            )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
  Widget whereto() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            width: Get.width,
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10 ),
                  child: Text(
                    "Where to?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.whereTo.value = true;
                        },
                        child: Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey.shade600,
                                  size: 30,
                                ),
                                const Text(
                                  "City Taxi",
                                  style: TextStyle(color: Colors.black),
                                )
                              ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.whereTo.value = true;
                        },
                        child: Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.access_time,
                                    color: Colors.grey.shade600, size: 30),
                                const Text(
                                  "Outstation",
                                  style: TextStyle(color: Colors.black),
                                )
                              ]),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Fluttertoast.showToast(
                      //         msg: "Coming soon..",
                      //         toastLength: Toast.LENGTH_SHORT,
                      //         gravity: ToastGravity.CENTER,
                      //         timeInSecForIosWeb: 1,
                      //         backgroundColor: Colors.white,
                      //         textColor: Colors.black,
                      //         fontSize: 14.0);
                      //   },
                      //   child: Container(
                      //     height: 70,
                      //     width: 80,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: Colors.grey.shade100),
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Icon(Icons.access_time,
                      //               color: Colors.grey.shade600, size: 30),
                      //           const Text(
                      //             "Rental",
                      //             style: TextStyle(color: Colors.black),
                      //           )
                      //         ]),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
  Widget build(BuildContext context) {
    MapUtils.initialize();

    Set<Polyline> buildPolylines() {
      return {
        if (MapUtils.locationList.isNotEmpty)
          Polyline(
            polylineId: const PolylineId('polyline'),
            points: MapUtils.locationList, // Use locationList from MapUtils
            color: Colors.blue,
            width: 5,
          ),
      };
    }
    Widget googleMapWidget() {
      return Obx(
            () => controller.isLoading.value == false
            ? GoogleMap(
          mapType: MapType.normal,
          markers: controller.markers,
          polylines: controller.polylines,
          initialCameraPosition: controller.cameraPosition,
          onMapCreated: (GoogleMapController controller1) {
            MapUtils.mapController = controller1;
          },
          circles: <Circle>{
            Circle(
              circleId: const CircleId("user_location_accuracy"),
              center: LatLng(controller.currentLocation.value.latitude!,
                  controller.currentLocation.value.longitude!),
              strokeWidth: 50,
              strokeColor: Colors.blue.withOpacity(0.2),
              fillColor: Colors.blue.withOpacity(0.2),
              radius: controller.currentLocation.value.accuracy!,
            )
          },
          onCameraMove: (position) {
            controller.mapController!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: position.target,
                  zoom: position.zoom,
                  bearing: MapUtils.getRotation(
                    LatLng(
                        controller.startLatLog,
                        controller
                            .endLatLog), // Start position, change as needed
                    position.target,
                  ),
                ),
              ),
            );
          },
          rotateGesturesEnabled: true,
          compassEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        )
            : const Center(child: CircularProgressIndicator()),
      );
    }
    final pickupDropIconWidget = Column(
      children: [
        const SizedBox(height: 8),
        const Icon(
          Icons.trip_origin_rounded,
          color: Colors.white,
          size: 28,
        ),
        Container(
          height: 54,
          child: CustomPaint(
              size: const Size(1, double.infinity),
              painter: DashedLineVerticalPainter()),
        ),
        const Icon(
          Icons.place_rounded,
          color: Colors.white,
          size: 28,
        ),
      ],
    );

    final tvPickupAddress = Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(getScreenWidth(context) - 100, 42),
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(21))),
          ),
          child: Row(
            children: [
              Expanded(
                child: StreamBuilder(
                    stream: controller.pickUpLocationStream,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        controller.startLatLog = LatLng(
                            snapshot.data!.latitude!, snapshot.data!.longitude!);
                        if (controller.startLatLog != null &&
                            controller.endLatLog != null) {
                          var rr = MapUtils.getRotation(
                              controller.startLatLog, controller.endLatLog);

                          print("my rrs:$rr");
                        }
                      }
                      final address = snapshot.data == null
                          ? "Enter pickup location"
                          : snapshot.data!.address ?? "Enter pickup location";
                      if (snapshot.data != null &&
                          snapshot.data!.address != null) {
                        controller.sourceAddress.value = snapshot.data!.address!;
                      }
                      return Text(
                        address,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      );
                    }),
              ),
            ],
          ),
          onPressed: () {
            Get.to(() => search(
              title: "Enter Pickup Location",
              sink: controller.pickUpLocationSink,
            ));
          },
        ),
        SizedBox(
          width: 15, // Set the width as desired
          height: 35,
          child: IconButton(
            icon: Icon(Icons.my_location, color: Colors.white),
            onPressed: () async {
              try {
                var currentLocation = await getCurrentLocation();
                controller.startLatLog = LatLng(
                  currentLocation.latitude as double,
                  currentLocation.longitude as double,
                );
                print("$currentLocation");
                controller.sourceAddress.value = "Current Location";
                controller.pickUpLocationSink.add(currentLocation);
                            } catch (e) {
                // Handle any exceptions that might occur during the process
                print("Error: $e");
              }
            },
          ),
        ),
      ],
    );
    final tvDropAddress = ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(getScreenWidth(context) - 100, 42),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(21))),
      ),
      child: Row(
        children: [
          Expanded(
            child: StreamBuilder<PlaceDetail>(
                stream: controller.dropLocationStream,
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    controller.endLatLog = LatLng(
                        snapshot.data!.latitude!, snapshot.data!.longitude!);
                    controller.start = snapshot.data!.latitude!;
                    controller.end = snapshot.data!.longitude;
                    if (controller.startLatLog != null &&
                        controller.endLatLog != null) {
                      MapUtils.getRotation(
                          controller.startLatLog, controller.endLatLog);

                      controller.distance.value = controller.calculateDistance(
                          controller.startLatLog.latitude,
                          controller.startLatLog.longitude,
                          controller.endLatLog.latitude,
                          controller.endLatLog.longitude);
                    }
                    controller.destination = snapshot.data!.address;
                  }

                  final address = snapshot.data == null
                      ? "Enter drop location"
                      : snapshot.data!.address ?? "Enter drop location";
                  if (snapshot.data != null && snapshot.data!.address != null) {
                    controller.destinationAddress.value = snapshot.data!.address!;
                  }
                  return Text(
                    address,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  );
                }),
          ),
        ],
      ),
      onPressed: () {
        Get.to(search(
            title: "Enter drop Location", sink: controller.dropLocationSink));
      },
    );
    final pickupDropWidget = Container(
      height: 250,
      width: getScreenWidth(context),
      decoration: const BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18, top: 20, bottom: 4),
                child: IconButton(
                  onPressed: () {
                    controller.whereTo.value = false;
                    controller.cabAvailable.value = false;
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: pickupDropIconWidget,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                        const EdgeInsets.only(left: 0, top: 0, bottom: 4),
                        child: Text(
                          "From",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      tvPickupAddress,
                      Container(
                        padding:
                        const EdgeInsets.only(left: 0, top: 8, bottom: 4),
                        child: Text(
                          "To",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      tvDropAddress,
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
    return PopScope(
      onPopInvoked: (didPop) {
        controller.whereTo.value = false;
        controller.cabAvailable.value = false;
      },
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          drawer: const SideMenuView(),
          key: controller.scaffoldKey,
          body: Stack(
            children: [
              googleMapWidget(),
              Obx(() => (controller.cabAvailable.value == true)
                  ? cabsList()
                  : whereto()),
              menu(),
              Obx(
                    () => Visibility(
                    visible: controller.whereTo.value, child: pickupDropWidget),
              ),
            ],
          ),
        ),
      ),
    );
  }


// Mock method to get the current location
  Future<PlaceDetail> getCurrentLocation() async {
    try {
      // Assuming controller.currentLocation.value is a type with latitude and longitude properties
      double? latitude = controller.currentLocation.value.latitude;
      double? longitude = controller.currentLocation.value.longitude;

      if (latitude == null || longitude == null) {
        throw Exception("Current location not available");
      }

      // Get the address from latitude and longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      String address = "";
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String street = place.thoroughfare ?? place.name ?? ""; // Adjust based on available data
        String locality = place.locality ?? "";
        String country = place.country ?? "";

        address = "$street, $locality, $country";
      }

      return PlaceDetail(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
    } catch (e) {
      print("Error getting current location: $e");
      rethrow;
    }
  }

  Widget sheet() {
    bool locationDisplayed =
    false; // Flag to track whether location has been displayed
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 1,
      snapSizes: [0.3, 1],
      snap: true,
      builder: (BuildContext context, scrollSheetController) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            controller: scrollSheetController,
            itemCount: controller.cars.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 120,
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Icon(
                                Icons.trip_origin_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              Container(
                                height: 30,
                                margin: const EdgeInsets.only(left: 14),
                                child: CustomPaint(
                                  size: const Size(1, double.infinity),
                                  painter: DashedLineVerticalPainter(),
                                ),
                              ),
                              const Icon(
                                Icons.place_rounded,
                                color: Colors.white,
                                size: 32,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                // Only show "Your Location" content if it hasn't been displayed yet
                                if (!locationDisplayed)
                                  const Text(
                                    "Your Location",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: StreamBuilder<PlaceDetail>(
                                    stream: controller.dropLocationStream,
                                    builder: (context, snapshot) {
                                      if (snapshot.data != null) {
                                        controller.destination =
                                            snapshot.data!.address;
                                      }

                                      final address = snapshot.data == null
                                          ? "lafdasfafafa"
                                          : snapshot.data!.address ??
                                          "lafdasfafafa";

                                      // Update the flag once location content is displayed
                                      if (!locationDisplayed) {
                                        locationDisplayed = true;
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 13),
                                        child: Container(
                                          child: Text(
                                            address,
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
  Widget menu() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          controller.scaffoldKey.currentState?.openDrawer();
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 3),
                color: Colors.grey.shade300),
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 25,
            )),
      ),
    );
  }
}

