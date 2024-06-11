import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapUtils {

  static Polyline? grayPolyline;
  static Polyline? blackPolyline;
  static GoogleMapController? mapController;
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static List<LatLng> locationList = [];
  static int number = 0;
  static String driverId = "";
late CameraPosition cameraPosition;
  static BitmapDescriptor ?carIcon;
  static BitmapDescriptor ?auto;
  static BitmapDescriptor ?volvo;
  static BitmapDescriptor ?suv;
  static BitmapDescriptor ?bike;
  static BitmapDescriptor ?ambulance;
  static BitmapDescriptor ?sedun;
  static BitmapDescriptor ?destinationIcon;

  static Future<BitmapDescriptor> _createCustomMarkerBitmap(String asset) async {
    return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)), asset);
  }

  static Future<void> initialize() async {
    carIcon = await _createCustomMarkerBitmap("assets/cab_image.png");
    auto = await _createCustomMarkerBitmap("assets/auto.png");
    volvo = await _createCustomMarkerBitmap("assets/volvo.png");
    destinationIcon = await _createCustomMarkerBitmap("assets/destination_icon.png");
  }

  static void getDriverId(String id) {
    driverId = id;
  }

  static Future<List<LatLng>> getListOfLocationsTracking(driverId) async {
    if (driverId.isNotEmpty) {
      var document = await db.collection("KERALACABS_DRIVER_STATUS").doc(driverId).get();
      if (document.exists) {
        var data = document.data()!;
        var latitude = data["LATITUDE"].toDouble();
        var longitude = data["LONGITUDE"].toDouble();
        locationList.add(LatLng(latitude, longitude));
        print("This is the location $locationList");
      }
    } else {
      locationList.clear();
    }
    return locationList;
  }

  static BitmapDescriptor getOriginDestinationMarkerBitmap() {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  }

  static double getRotation(LatLng start, LatLng end) {
    double latDifference = (start.latitude - end.latitude).abs();
    double lngDifference = (start.longitude - end.longitude).abs();
    late double rotation;
    if (start.latitude < end.latitude && start.longitude < end.longitude) {
      rotation = atan(lngDifference / latDifference);
    } else if (start.latitude >= end.latitude && start.longitude < end.longitude) {
      rotation = pi / 2 - atan(lngDifference / latDifference);
    } else if (start.latitude >= end.latitude && start.longitude >= end.longitude) {
      rotation = pi + atan(lngDifference / latDifference);
    } else if (start.latitude < end.latitude && start.longitude >= end.longitude) {
      rotation = 3 * pi / 2 - atan(lngDifference / latDifference);
    } else {
      rotation = -1.0;
    }
    return rotation * 180 / pi;
  }
}
