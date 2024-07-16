import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get_storage/get_storage.dart';
import '../../../service/api_end_points.dart';

class MytripView extends StatefulWidget {
  const MytripView({Key? key}) : super(key: key);

  @override
  _MytripViewState createState() => _MytripViewState();
}

class _MytripViewState extends State<MytripView> {
  List<dynamic> datafromapi = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      String userId = getUserId();
      print("this is testing: $userId");
      final response = await http.get(Uri.parse('${ApiEndPoints.ENDPOINT_TRIP_HISTORY}/$userId'));
      if (response.statusCode == 200) {
        setState(() {
          datafromapi = json.decode(response.body)['data'];
          isLoading = false;
          print("Data fetched successfully for userId: $userId");
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  String getUserId() {
    // Assuming you have a method to get the user ID from GetStorage
    return GetStorage().read('id');
  }

  String formatTime(String? dateTime) {
    if (dateTime != null) {
      print('Received date string: $dateTime');
      try {
        final DateFormat originalFormat = DateFormat("EEE MMM dd HH:mm:ss 'UTC' yyyy");
        final DateTime parsedDateTime = originalFormat.parse(dateTime, true);
        final DateFormat desiredFormat = DateFormat('MMM dd, yyyy hh:mm a');
        return desiredFormat.format(parsedDateTime.toLocal());
      } catch (e) {
        print('Error parsing date: $dateTime');
      }
    }
    return 'Invalid date';
  }

  Color getStatusColor(String status) {
    if (status.toUpperCase() == 'RESERVED') {
      return Colors.green; // Green color for 'Reserved'
    } else if (status.toUpperCase() == 'CANCELLED') {
      return Colors.red; // Red color for 'Cancelled'
    } else {
      return Colors.black; // Default color for other statuses
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trip History',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_blur.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: isLoading
            ? Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            size: 50,
            color: Colors.yellow,
          ),
        )
            : datafromapi.isNotEmpty
            ? ListView.builder(
          itemCount: datafromapi.length,
          itemBuilder: (context, index) {
            final trip = datafromapi[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RideDetailPage(data: trip),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black87,
                          child: Icon(
                            Icons.local_taxi,
                            color: Colors.yellow,
                            size: 33,
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trip['destination'] ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 8),
                              Text(
                                formatTime(trip['endTIme']),
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Status: ${trip['rideStatus'] ?? ''}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: getStatusColor(trip['rideStatus'] ?? ''),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
            : Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 2,
                width: 70,
                color: Colors.amber,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Trip History",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 2,
                width: 70,
                color: Colors.amber,
              ),
              Text(
                'No trip history available.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RideDetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const RideDetailPage({required this.data});

  String formatTime(String? dateTime) {
    if (dateTime != null) {
      try {
        final DateFormat originalFormat = DateFormat('EEE MMM dd HH:mm:ss \'UTC\' yyyy');
        final DateTime parsedDateTime = originalFormat.parseUtc(dateTime);
        final DateFormat desiredFormat = DateFormat('MMM dd, yyyy hh:mm a');
        return desiredFormat.format(parsedDateTime);
      } catch (e) {
        print('Error parsing date: $dateTime');
      }
    }
    return 'Invalid date';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                '${data['driverName'] ?? 'N/A'}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 25.0,
                  ),
                  Text(
                    '${data['star'] ?? 'N/A'}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/source.png',
                    width: 18.0,
                    height: 18.0,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Source: ${data['source'] ?? 'N/A'}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/destination.png',
                    width: 18.0,
                    height: 18.0,
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Destination: ${data['destination'] ?? 'N/A'}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Start Time: ${formatTime(data['startTIme'])}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'End Time: ${formatTime(data['endTime'])}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Category: ${data['category'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Payment Method: ${data['payment'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'KM: ${data['km'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Price: ${data['totalPrice'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

