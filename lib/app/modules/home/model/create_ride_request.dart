class CreateRideRequest {
  String? category;
  String? destination;
  String? driverId;
  double? latitude;
  double? longitude;
  String? payment;
  String? source;
  String? status;
  String? tripId;
  String? type;
  String? userId;

  CreateRideRequest(
      {this.category,
      this.destination,
      this.driverId,
      this.latitude,
      this.longitude,
      this.payment,
      this.source,
      this.status,
      this.tripId,
      this.type,
      this.userId});

  CreateRideRequest.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    destination = json['destination'];
    driverId = json['driverId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    payment = json['payment'];
    source = json['source'];
    status = json['status'];
    tripId = json['tripId'];
    type = json['type'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['destination'] = destination;
    data['driverId'] = driverId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['payment'] = payment;
    data['source'] = source;
    data['status'] = status;
    data['tripId'] = tripId;
    data['type'] = type;
    data['userId'] = userId;
    return data;
  }
}
