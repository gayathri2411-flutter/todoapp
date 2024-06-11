class AdvanceSearch_v1_Request {
  String? category;
  String? company;
  String? destination;
  int? distance;
  String? domain;
  String? id;
  int? km;
  double? latitude;
  double? longitude;
  String? notification;
  int? price;
  String? region;
  String? source;
  String? type;

  AdvanceSearch_v1_Request(
      {this.category,
      this.company,
      this.destination,
      this.distance,
      this.domain,
      this.id,
      this.km,
      this.latitude,
      this.longitude,
      this.notification,
      this.price,
      this.region,
      this.source,
      this.type});

  AdvanceSearch_v1_Request.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    company = json['company'];
    destination = json['destination'];
    distance = json['distance'];
    domain = json['domain'];
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['category'] = category;
    data['company'] = company;
    data['destination'] = destination;
    data['distance'] = distance;
    data['domain'] = domain;
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
