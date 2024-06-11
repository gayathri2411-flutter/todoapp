class AdvanceSearchRequest {
  String? category;
  String? dateTime;
  String? destination;
  int? distance;
  int? id;
  int? km;
  double? latitude;
  double? longitude;
  int? radius;
  String? region;
  String? source;

  AdvanceSearchRequest(
      {this.category,
      this.dateTime,
      this.destination,
      this.distance,
      this.id,
      this.km,
      this.latitude,
      this.longitude,
      this.radius,
      this.region,
      this.source});

  AdvanceSearchRequest.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    dateTime = json['dateTime'];
    destination = json['destination'];
    distance = json['distance'];
    id = json['id'];
    km = json['km'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    radius = json['radius'];
    region = json['region'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['dateTime'] = dateTime;
    data['destination'] = destination;
    data['distance'] = distance;
    data['id'] = id;
    data['km'] = km;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['radius'] = radius;
    data['region'] = region;
    data['source'] = source;
    return data;
  }
}
