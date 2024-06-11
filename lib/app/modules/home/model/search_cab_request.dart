class SearchCabRequest {
  String? company;
  String? destination;
  double? distance;
  String? id;
  double? km;
  double? latitude;
  double? longitude;
  String? notification;
  int? price;
  String? region;
  String? source;
  String? type;

  SearchCabRequest(
      {this.company,
      this.destination,
      this.distance,
      this.id,
      this.km,
      this.latitude,
      this.longitude,
      this.notification,
      this.price,
      this.region,
      this.source,
      this.type});

  SearchCabRequest.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    destination = json['destination'];
    distance = json['distance'];
    id = json['id'];
    km = json['km'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    notification = json['notification'];
    price = json['price'];
    region = json['region'];
    source = json['source'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company'] = company;
    data['destination'] = destination;
    data['distance'] = distance;
    data['id'] = id;
    data['km'] = km;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['notification'] = notification;
    data['price'] = price;
    data['region'] = region;
    data['source'] = source;
    data['type'] = type;
    return data;
  } 
}
