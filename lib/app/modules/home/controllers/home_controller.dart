// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_catch_error, unused_local_variable, library_prefixes, prefer_final_fields, unused_field, avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:newuser/app/modules/home/model/adSearchV1Response.dart';
import 'package:newuser/app/modules/home/model/adSearchV2Response.dart';
import 'package:newuser/app/modules/home/model/booking_request.dart';
import 'package:newuser/app/modules/home/model/create_ride_request.dart';
import 'package:newuser/app/modules/home/model/place_response.dart';
import 'package:newuser/app/modules/home/model/price_calculation_request.dart';
import 'package:newuser/app/modules/home/model/price_calculation_response.dart';
import 'package:newuser/app/modules/home/model/search_cab_request.dart';
import 'package:newuser/app/modules/home/model/search_cab_response.dart';
import 'package:newuser/app/modules/home/repo/home_repository.dart';
import 'package:location/location.dart';
import 'package:newuser/app/service/ride_provider.dart';
import 'package:newuser/app/widgets/shared_functions.dart';
import '../../../../main.dart';
import '../../../widgets/book_a_ride.dart';
import '../../../widgets/profile_details.dart';

class HomeController extends GetxController {
  final HomeRepository repo;
  HomeController(this.repo);
  var email;
  var name;
  var number;
  var image;
  var id;
  var startLatLog;
  var endLatLog;
  var destination;

  adSearchV2Response? nearbyDrivers;
  AdvanceSearch_v1_Response? driverList;
  RxDouble distance = 0.0.obs;
  RxBool whereTo = false.obs;
  RxDouble sourceLat = 0.0.obs;
  RxDouble sourceLng = 0.0.obs;
  RxDouble destinationLat = 0.0.obs;
  RxDouble destinationLng = 0.0.obs;
  RxBool pageLoading = false.obs;
  RxDouble price = 0.0.obs;
  SearchCabResponse cabList = SearchCabResponse();
  RxBool cabAvailable = false.obs;
  BitmapDescriptor? sourceIcon;
  BitmapDescriptor? destinationIcon;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  final profileDetails = getIt.get<ProfileDetails>();
  List cars = [
    {
      "Availavble": "",
      "name": "HatchBack",
      "content": "Affoardable Price",
      "km": "",
      "price": "",
      "image": "assets/hatch.png"
    },
    {
      "Availavble": "",
      "name": "Sedan",
      "content": "Extra Luggage spacwe",
      "km": "",
      "price": "",
      "image": "assets/sedan.png"
    },
    {
      "Availavble": "",
      "name": "Suv",
      "content": "Extra leg room space",
      "km": "",
      "price": "",
      "image": "assets/suvv.png"
    },
    {
      "Availavble": "",
      "name": "Auto",
      "content": "Cheapest Price",
      "km": "",
      "price": "",
      "image": "assets/auto_copy.png"
    },
    {
      "Availavble": "",
      "name": "Transport",
      "content": "AdvanceBooking Only",
      "km": "",
      "price": "",
      "image": "assets/traveller.png"
    },
    {
      "Availavble": "",
      "name": "Bike",
      "content": "For goods Delivery only",
      "km": "",
      "price": "",
      "image": "assets/bike_3.png"
    },
    {
      "Availavble": "",
      "name": "Ambulance",
      "content": "Have service within city limit",
      "km": "",
      "price": "",
      "image": "assets/ambulance.png"
    },
  ];
  @override
  void onInit() {
    super.onInit();
    createIcons();
    requestLocationPermission();
    userDetails();
    fetchprofileDetails();
  }

  void createIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2), "assets/source.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2),
        "assets/destination.png");
  }

  void userDetails() async {
    await repo
        .userDetails()
        .then((value) => {
              if (value.status == true)
                {
                  if (value.message != null)
                    {
                      Fluttertoast.showToast(
                          msg: value.message.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 14.0),
                    },
                  name = value.data!.firstName,
                  email = value.data!.email,
                  number = value.data!.phoneNumber,
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

  void fetchprofileDetails() async {
    await repo
        .profileDetails()
        .then((value) => {
              if (value.status == true)
                {
                  profileDetails.setUser(value.data!.toJson()),
                  if (value.message != null)
                    {
                      Fluttertoast.showToast(
                          msg: value.message.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 14.0),
                    },
                  image = value.data!.isImage,
                  id = value.data!.id,
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

  setMarkers() {
    markers = {};
    markers = {
      Marker(
          markerId: const MarkerId("destinationLocation"),
          position: LatLng(sourceLat.value, sourceLng.value),
          icon: sourceIcon!),
      Marker(
          markerId: const MarkerId("destinationLocation"),
          position: LatLng(destinationLat.value, destinationLng.value),
          icon: destinationIcon!)
    };
  }

  getPloyLine() async {
    polylines = {};
    polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyCF6-zrlvLauV0u3QoAGxPkGpEM1hXlFnc",
        PointLatLng(sourceLat.value, sourceLng.value),
        PointLatLng(destinationLat.value, destinationLng.value));
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      polylines.add(Polyline(
          polylineId: const PolylineId('polyline'),
          visible: true,
          points: polylineCoordinates,
          color: Colors.blue,
          width: 5));
    }
  }

  void searchForCabs() async {
    setMarkers();
    getPloyLine();

    try {
      isLoading.value = true;
      PriceCalculationResponse priceCalculationResponse =
          PriceCalculationResponse();
      PriceCalculationRequest priceCalculationRequest =
          PriceCalculationRequest();
      priceCalculationRequest.category = "TAXI";
      priceCalculationRequest.destination = destinationAddress.value;
      priceCalculationRequest.discount = 0;
      priceCalculationRequest.distance = distance.value;
      priceCalculationRequest.domain = "TAXIDEALS";
      priceCalculationRequest.elapsedTime = 0;
      priceCalculationRequest.googleKm = distance.value;
      priceCalculationRequest.latitude = sourceLat.value;
      priceCalculationRequest.longitude = sourceLng.value;
      priceCalculationRequest.region = destinationAddress.value;
      priceCalculationRequest.rideId = 0;
      priceCalculationRequest.sourceLatitude = destinationLat.value;
      priceCalculationRequest.sourceLongitude = destinationLng.value;
      priceCalculationRequest.status = "";
      priceCalculationRequest.travelTime = 0;
      priceCalculationRequest.type = "";
      priceCalculationRequest.waitingTime = 0;
      SearchCabRequest request = SearchCabRequest();
      request.company = "TAXI";
      request.destination = destinationAddress.value;

      request.id = null;
      request.latitude = sourceLat.value;
      request.longitude = sourceLng.value;
      request.notification = "";

      request.region = destinationAddress.value;
      request.source = sourceAddress.value;
      request.type = null;
      request.distance = distance.value;
      await repo
          .priceCalculation(request: priceCalculationRequest)
          .then((value) => {
                priceCalculationResponse = value,
                request.price = double.parse(
                        priceCalculationResponse.data!.totalPrice.toString())
                    .round(),
                price.value = priceCalculationResponse.data!.totalPrice!,
                debugPrint("the request body is : ${request.toJson()}"),
                repo
                    .advanceSearchV2(request: request)
                    .then((value) => {
                          cabList = value,
                          isLoading.value = false,
                          if (cabList.data!.isNotEmpty)
                            {
                              cabAvailable.value = true,
                            }
                          else
                            {
                              toastify("No Cabs found"),
                              cabAvailable.value = false,
                            },
                          pageLoading.value = false,
                        })
                    .catchError((e) {
                  isLoading.value = false;
                  toastify(e);
                }),
              })
          .catchError((e) {
        toastify(e);
      });
    } catch (exception) {
      isLoading.value = false;
      rethrow;
    }
  }

  void copon() async {
    Booking_Request request = Booking_Request();
    await repo
        .booking(request: request)
        .then((value) => {
              if (value.status == true)
                {}
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

  Future bookRide(carDetails) async {
    String token = "";
    await getDeviceToken().then((value) => {
          token = value,
        });
    var request;
    bool status = false;
    RideProvider rideProvider = RideProvider();
    CreateRideRequest createRideRequest = CreateRideRequest();
    createRideRequest.category = "";
    createRideRequest.driverId = carDetails["driverId"];
    createRideRequest.destination = destinationAddress.value;
    createRideRequest.latitude = sourceLat.value;
    createRideRequest.longitude = sourceLng.value;
    createRideRequest.payment = "CASH";
    createRideRequest.source = sourceAddress.value;
    createRideRequest.tripId = "";
    createRideRequest.status="RESERVED";
    createRideRequest.type = "";
    createRideRequest.userId = profileDetails.current["id"];
    await rideProvider.createRide(request: createRideRequest).then((value) => {
          request = {
            "to": carDetails["token"],
            "notification": {
              "title": sourceAddress.value,
              "body": destinationAddress.value,
              "mutable-content": true,
              "sound": "Tri-tone",
            },
            "data": {
              "customerName":profileDetails.current["firstName"],
              "number":profileDetails.current["phoneNumber"],
              "tripId":value.data!,
              "userId":profileDetails.current["id"],
              "senderToken": token,
              "sourceAddress":sourceAddress.value,
              "driverId":carDetails["driverId"],
              "destinationAddress":destinationAddress.value,
              "sourceLat": sourceLat.value,
              "sourceLng": sourceLng.value,
              "destinationLat": destinationLat.value,
              "destinationLng": destinationLng.value,
              "price": price.value,
              "km":distance.value
            }
          },
          bookCab(request).then((value) => {
                status = value,
                bookride.setStatus(1),
              }),
        });
    return status;
  }

  void booking() async {
    Booking_Request request = Booking_Request();
    await repo
        .booking(request: request)
        .then((value) => {
              if (value.status == true)
                {}
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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController? mapController;

  RxBool isLoading = true.obs;
  var start;
  var end;
  RxString sourceAddress = "".obs;
  RxString destinationAddress = "".obs;
  late CameraPosition cameraPosition;
  Location location = Location();
  Rx<LocationData> currentLocation = Rx<LocationData>(LocationData.fromMap({}));
  final _pickUpLocationSC = StreamController<PlaceDetail>.broadcast();
  StreamSink<PlaceDetail> get pickUpLocationSink => _pickUpLocationSC.sink;
  Stream<PlaceDetail> get pickUpLocationStream => _pickUpLocationSC.stream;

  final _dropUpLocationSC = StreamController<PlaceDetail>.broadcast();
  StreamSink<PlaceDetail> get dropLocationSink => _dropUpLocationSC.sink;
  Stream<PlaceDetail> get dropLocationStream => _dropUpLocationSC.stream;
  Future<void> requestLocationPermission() async {
    var locationPermission = await location.requestPermission();
    if (locationPermission == PermissionStatus.granted) {
      _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      var currentLocationData = await location.getLocation();
      currentLocation.value = currentLocationData;

      cameraPosition = CameraPosition(
        target: LatLng(currentLocation.value.latitude ?? 0.0,
            currentLocation.value.longitude ?? 0.0),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("currentLocation"),
          position: LatLng(currentLocation.value.latitude ?? 0.0,
              currentLocation.value.longitude ?? 0.0),
          icon: sourceIcon!));
      isLoading.value = false;
    } catch (e) {
      print('Error: $e');
    }
  }

  Set<Marker> markerS = {};
  static Future<BitmapDescriptor> createCustomMarkerBitmap(String asset) async {
    return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)), asset);
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2),
        'assets/driving_pin.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2),
        'assets/destination_map_marker.png');
  }

  void setUserLocationMarker() async {
    Set<Marker> markers = {};
    if (nearbyDrivers != null && nearbyDrivers!.data != null) {
      for (var taxiData in nearbyDrivers!.data!) {
        LatLng latLng = LatLng(taxiData.latitude!, taxiData.longitude!);

        BitmapDescriptor icon;
        switch (taxiData.carType) {
          case "Taxi4":
            icon = await createCustomMarkerBitmap('assets/ic_car.png');

            break;
          case "Taxi":
            icon = await createCustomMarkerBitmap('assets/ic_car.png');
            break;
          case "Taxi6":
            icon = await createCustomMarkerBitmap('assets/ic_car.png');
            break;
          case "Auto":
            icon = await createCustomMarkerBitmap('assets/auto.png');
            break;
          case "Transport":
            icon = await createCustomMarkerBitmap('assets/volvo.png');
            break;
          case "Bike":
            icon = await createCustomMarkerBitmap('assets/ic_car.png');
            break;
          case "Ambulance":
            icon = await createCustomMarkerBitmap('assets/ic_car.png');
            break;
          default:
            icon = await createCustomMarkerBitmap('assets/ic_car.png');
            break;
        }

        Marker marker = Marker(
          markerId: MarkerId(taxiData.carType!),
          position: latLng,
          icon: icon,
          infoWindow: InfoWindow(title: taxiData.carType),
          anchor: const Offset(0.5, 0.5),
        );
        markers.add(marker);
      }
    }

    markerS = markers;
  }

  destinationMarker() {}
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(deg2rad(lat1)) *
            Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (Math.pi / 180);
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
