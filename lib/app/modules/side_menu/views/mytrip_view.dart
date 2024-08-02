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
    return GetStorage().read('id');
  }

  String formatTime(String? dateTime) {
    if (dateTime != null) {
      try {
        final DateFormat originalFormat = DateFormat("EEE MMM dd HH:mm:ss 'UTC' yyyy");
        final DateTime parsedDateTime = originalFormat.parse(dateTime, true);
        final DateFormat desiredFormat = DateFormat('MMM d, yyyy, h:mm a');
        return desiredFormat.format(parsedDateTime.toLocal());
      } catch (e) {
        print('Error parsing date: $dateTime');
      }
    }
    return 'Invalid date';
  }

  String getDayLabel(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(Duration(days: 1));

    if (dateTime.year == today.year && dateTime.month == today.month && dateTime.day == today.day) {
      return 'Today';
    } else if (dateTime.year == tomorrow.year && dateTime.month == tomorrow.month && dateTime.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      return DateFormat('MMM d, yyyy, h:mm a').format(dateTime);
    }
  }

  String formatDayLabel(String? dateTime) {
    if (dateTime != null) {
      try {
        final DateFormat originalFormat = DateFormat('EEE MMM dd HH:mm:ss \'UTC\' yyyy');
        final DateTime parsedDateTime = originalFormat.parseUtc(dateTime);
        return getDayLabel(parsedDateTime);
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
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
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
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                formatTime(trip['endTIme']),
                                style: TextStyle(fontSize: 14, color: Colors.grey),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.history, color: Colors.grey, size: 80),
              SizedBox(height: 16),
              Text(
                'No trip history available.',
                style: TextStyle(color: Colors.white, fontSize: 18),
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
        final DateFormat originalFormat = DateFormat("EEE MMM dd HH:mm:ss 'UTC' yyyy");
        final DateTime parsedDateTime = originalFormat.parse(dateTime, true); // Parse as UTC
        final DateFormat desiredFormat = DateFormat('MMM d, yyyy, h:mm a');
        return desiredFormat.format(parsedDateTime.toLocal()); // Convert to local time
      } catch (e) {
        print('Error parsing date: $dateTime');
      }
    }
    return 'Invalid date';
  }

  String getDayLabel(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime tomorrow = today.add(Duration(days: 1));

    if (dateTime.year == today.year && dateTime.month == today.month && dateTime.day == today.day) {
      return 'Today';
    } else if (dateTime.year == tomorrow.year && dateTime.month == tomorrow.month && dateTime.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      return DateFormat('MMM d, yyyy, h:mm a').format(dateTime);
    }
  }

  String formatDayLabel(String? dateTime) {
    if (dateTime != null) {
      try {
        final DateFormat originalFormat = DateFormat('EEE MMM dd HH:mm:ss \'UTC\' yyyy');
        final DateTime parsedDateTime = originalFormat.parseUtc(dateTime); // Parse as UTC
        return getDayLabel(parsedDateTime);
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trip Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TripDetailRow(
                icon: Icons.location_on,
                location: data['source'] ?? 'N/A',
                address: 'Source: ${data['source'] ?? 'N/A'}',
                time: formatDayLabel(data['startTIme']),
              ),
              TripDetailRow(
                icon: Icons.location_on_outlined,
                location: data['destination'] ?? 'N/A',
                address: 'Destination: ${data['destination'] ?? 'N/A'}',
                time: formatDayLabel(data['endTIme']),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          "assets/driverlogo.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data['driverName'] ?? 'N/A'}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text('Driver rating'),
                          SizedBox(width: 7),
                          Text('${data['star']}'),
                          Icon(Icons.star, color: Colors.orange),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Fare Breakdown',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              FareBreakdownRow(title: 'Base Fare', amount: '${data['base'] ?? 'N/A'}'),
              FareBreakdownRow(title: 'Booking Fare', amount: '${data['price'] ?? 'N/A'}'),
              FareBreakdownRow(title: 'Promo', amount: '- \$${data['discount'] ?? 'N/A'}', color: Colors.green),
              FareBreakdownRow(title: 'Total', amount: '${data['totalPrice'] ?? 'N/A'}'),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.payment, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    '${data['payment'] ?? 'N/A'}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TripDetailRow extends StatelessWidget {
  final IconData icon;
  final String location;
  final String address;
  final String time;

  const TripDetailRow({
    required this.icon,
    required this.location,
    required this.address,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.red),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location,
                maxLines: 1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                address,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Text(time, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class FareBreakdownRow extends StatelessWidget {
  final String title;
  final String amount;
  final Color? color;

  const FareBreakdownRow({
    required this.title,
    required this.amount,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 18,
            color: color ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
