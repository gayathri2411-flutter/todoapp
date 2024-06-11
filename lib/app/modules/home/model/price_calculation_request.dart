class PriceCalculationRequest {
  String? category;
  String? destination;
  int? discount;
  double? distance;
  String? domain;
  int? elapsedTime;
  double? googleKm;
  double? latitude;
  double? longitude;
  String? region;
  int? rideId;
  double? sourceLatitude;
  double? sourceLongitude;
  String? status;
  int? travelTime;
  String? type;
  int? waitingTime;

  PriceCalculationRequest(
      {this.category,
      this.destination,
      this.discount,
      this.distance,
      this.domain,
      this.elapsedTime,
      this.googleKm,
      this.latitude,
      this.longitude,
      this.region,
      this.rideId,
      this.sourceLatitude,
      this.sourceLongitude,
      this.status,
      this.travelTime,
      this.type,
      this.waitingTime});

  PriceCalculationRequest.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    destination = json['destination'];
    discount = json['discount'];
    distance = json['distance'];
    domain = json['domain'];
    elapsedTime = json['elapsedTime'];
    googleKm = json['googleKm'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    region = json['region'];
    rideId = json['rideId'];
    sourceLatitude = json['sourceLatitude'];
    sourceLongitude = json['sourceLongitude'];
    status = json['status'];
    travelTime = json['travelTime'];
    type = json['type'];
    waitingTime = json['waitingTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['destination'] = destination;
    data['discount'] = discount;
    data['distance'] = distance;
    data['domain'] = domain;
    data['elapsedTime'] = elapsedTime;
    data['googleKm'] = googleKm;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['region'] = region;
    data['rideId'] = rideId;
    data['sourceLatitude'] = sourceLatitude; 
    data['sourceLongitude'] = sourceLongitude;
    data['status'] = status;
    data['travelTime'] = travelTime;
    data['type'] = type;
    data['waitingTime'] = waitingTime;
    return data;
  }
}
