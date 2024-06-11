// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison, unused_local_variable, prefer_final_fields, prefer_const_constructors, camel_case_types, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newuser/app/modules/home/controllers/home_controller.dart';
import 'package:newuser/app/modules/home/map_Provider/map_provider.dart';
import 'package:newuser/app/modules/home/model/place_response.dart';
import 'package:newuser/app/modules/home/repo/home_repository.dart';
import 'package:newuser/app/service/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as loc;
import 'package:google_maps_webservice/places.dart' as places;

class search extends StatefulWidget {
  const search({super.key, this.title, required this.sink});
  final title;
  final StreamSink<PlaceDetail> sink;
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final homecontroller =
      Get.put(HomeController(HomeRepository(provider: Provider())));
  final _controller = TextEditingController();
  final sessionToken = Uuid().v4();
  final provider = PlaceApiProvider(Uuid().v4());
  List<Suggestion> suggestion = [];
  places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(
      apiKey: "AIzaSyCF6-zrlvLauV0u3QoAGxPkGpEM1hXlFnc");
  @override
  void initState() {
    super.initState();
    print("call");
    _controller.addListener(() async {
      if (_controller.text.length > 1) {
        provider.fetchSuggestions(_controller.text).then((value) {
          suggestion = value.cast<Suggestion>();
        });
      } else {
        suggestion.clear();
      }
      setState(() {});
    });
  }

  Future<void> _handleSearch() async {
    places.Prediction? p = await loc.PlacesAutocomplete.show(
        context: context,
        apiKey: 'AIzaSyCF6-zrlvLauV0u3QoAGxPkGpEM1hXlFnc',
        onError: onError, // call the onError function below
        mode: loc.Mode.overlay,
        language: 'en', //you can set any language for search
        strictbounds: false,
        types: [],
        decoration: InputDecoration(
            hintText: 'search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white))),
        components: [] // you can determine search for just one country
        );
    displayPrediction(p!);
  }

  Future<Null> displayPrediction(places.Prediction p) async {
    if (p != null) {
      places.PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId.toString());

      var placeId = p.placeId;
      double lat = detail.result.geometry!.location.lat;
      double lng = detail.result.geometry!.location.lng;

      // var address = await Geocoder.local.findAddressesFromQuery(p.description);
      PlaceDetail placeDetails = PlaceDetail(
        address: p.description,
        latitude: lat,
        longitude: lng,
        name: p.description,
      );

      if (widget.title == 'Enter Pickup Location') {
        homecontroller.pickUpLocationSink.add(placeDetails);
        homecontroller.sourceLat.value = lat;
        homecontroller.sourceLng.value = lng;
        debugPrint(
            "the resss : ${homecontroller.sourceLat.value} , ${homecontroller.sourceLng.value}");
      } else {
        homecontroller.dropLocationSink.add(placeDetails);
        homecontroller.destinationAddress.value=placeDetails.address!;
        homecontroller.destinationLat.value = lat; 
        homecontroller.destinationLng.value = lng;
        homecontroller.searchForCabs();
      }
      Get.back();
    }
  }
  
  void onError(places.PlacesAutocompleteResponse response) {
    debugPrint("errorr : ${response.errorMessage}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_rounded),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16, top: 16, bottom: 4),
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 18, top: 8, right: 18),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                onChanged: (v) {
                  _handleSearch();
                },
                onTap: () {
                  _handleSearch();
                },
                controller: _controller,
                textAlign: TextAlign.start,
                autocorrect: false,
                autofocus: true,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  icon: Container(
                    margin: const EdgeInsets.only(left: 12),
                    width: 32,
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                  hintText: "Enter location",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 4),
                        child: Text(
                          (suggestion[index]).title,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4, bottom: 8),
                        child: Text(
                          (suggestion[index]).description,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  leading: const Icon(
                    Icons.place_rounded,
                    color: Colors.amber,
                    size: 32,
                  ),
                  onTap: () async {
                    print("object");
                    final placeDetail = await provider
                        .getPlaceDetailFromId(suggestion[index].placeId);

                    // widget.sink.add(placeDetail);
                    if (widget.title == 'Enter Pickup Location') {
                      homecontroller.pickUpLocationSink.add(placeDetail);
                    } else {
                      homecontroller.dropLocationSink.add(placeDetail);
                    }

                    Get.back();
                  },
                ),
                itemCount: suggestion.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
