import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPresenter extends GetxController {
  late GoogleMapController mapController;
  List<Marker> markers = [];

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    requestNearbyCabs(LatLng(37.7749, -122.4194)); // San Francisco, CA
  }

  void requestNearbyCabs(LatLng latLng) async {
    final jsonObject = {
      'type': 'NEAR_BY_CABS',
      'lat': latLng.latitude,
      'lng': latLng.longitude
    };
    final jsonEncoded = jsonEncode(jsonObject);
    // Simulating sending message
    handleOnMessageNearbyCabs({
      'locations': [
        {'lat': 37.7756, 'lng': -122.4163},
        {'lat': 37.7722, 'lng': -122.4376},
      ]
    });
  }

  void handleOnMessageNearbyCabs(dynamic jsonObject) {
    final nearbyCabLocations = <Marker>[];
    final jsonArray = jsonObject['locations'] as List<dynamic>;
    for (final item in jsonArray) {
      final lat = item['lat'] as double;
      final lng = item['lng'] as double;
      final latLng = LatLng(lat, lng);
      nearbyCabLocations.add(
        Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
        ),
      );
    }
    markers = nearbyCabLocations;
    update();
  }

}