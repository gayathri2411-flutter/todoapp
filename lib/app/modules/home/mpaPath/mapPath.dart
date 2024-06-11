import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;

class GoogleMapsPath {
  final LatLng origin;
  final LatLng dest;

  GoogleMapController? mapController;

  GoogleMapsPath(this.origin, this.dest);

  Future<void> drawPath(GoogleMapController controller) async {
    mapController = controller;

    String url = _getDirectionsUrl(origin, dest);
    String data = await _downloadUrl(url);
    List<List<LatLng>> routes = _parseData(data);

    if (routes.isNotEmpty) {
      routes.forEach((route) {
        _drawRoute(route);
      });
    }
  }

  String _getDirectionsUrl(LatLng origin, LatLng dest) {
    String str_origin = "origin=${origin.latitude},${origin.longitude}";
    String str_dest = "destination=${dest.latitude},${dest.longitude}";
    String sensor = "sensor=false";
    String parameters = "$str_origin&$str_dest&$sensor";

    return "https://maps.googleapis.com/maps/api/directions/json?${parameters}";
  }

  Future<String> _downloadUrl(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  List<List<LatLng>> _parseData(String data) {
    List<List<LatLng>> routes = [];

    Map<String, dynamic> jsonData = json.decode(data);
    List<dynamic> routesData = jsonData['routes'];

    routesData.forEach((routeData) {
      List<dynamic> legs = routeData['legs'];
      List<LatLng> points = [];

      legs.forEach((leg) {
        List<dynamic> steps = leg['steps'];

        steps.forEach((step) {
          Map<String, dynamic> polyline = step['polyline'];
          String pointsEncoded = polyline['points'];

          List<LatLng> decodedPoints = _decodePoly(pointsEncoded);
          points.addAll(decodedPoints);
        });
      });

      routes.add(points);
    });

    return routes;
  }

  List<LatLng> _decodePoly(String encoded) {
    List<LatLng> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;
      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      double latDouble = lat / 1E5;
      double lngDouble = lng / 1E5;
      LatLng position = LatLng(latDouble, lngDouble);
      poly.add(position);
    }
    return poly;
  }

void _drawRoute(List<LatLng> route) {
  if (mapController != null) {
    // mapController!.clear();

    // Add polyline to the map
    Polyline polyline = Polyline(
      polylineId: PolylineId("route"),
      points: route,
      color: Colors.red,
      width: 8,
    );
    PolylineId id = PolylineId("route");
    // mapController!.addPolyline(polyline);

    // Define markers
    Set<Marker> markers = {};

    if (dest != null) {
      // Add destination marker to the map
      Marker marker = Marker(
        markerId: MarkerId("destination"),
        position: dest,
        infoWindow: InfoWindow(title: "Destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
      markers.add(marker);
    }

    if (origin != null) {
      // Add origin marker to the map
      Marker marker = Marker(
        markerId: MarkerId("origin"),
        position: origin,
        infoWindow: InfoWindow(title: "Origin"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      );
      markers.add(marker);
    }

    // Set markers on the map
    // mapController!.addMarkers(markers);
  }
}

}
