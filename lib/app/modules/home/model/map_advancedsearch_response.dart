// ignore_for_file: prefer_typing_uninitialized_variables

class AdvanceSearchResponse {
  int? statusCode;
  bool? status;
  String? message;
  List<Data>? data;
  var jwt; 
  int? infoId;

  AdvanceSearchResponse(
      {this.statusCode,
      this.status,
      this.message,
      this.data, 
      this.jwt,
      this.infoId});

  AdvanceSearchResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    jwt = json['jwt'];
    infoId = json['infoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['jwt'] = jwt;
    data['infoId'] = infoId;
    return data;
  }
}

class Data {
  String? id;
  double? latitude;
  double? longitude;
  String? phoneNumber;
  String? name;
  var phonenumber;
  String? status;
  var image;
  String? token;
  String? notificationToken;
  var imageBype;
  String? driverId;
  String? carType;
  String? price;
  String? category;
  var region;
  var company;

  Data(
      {this.id,
      this.latitude,
      this.longitude,
      this.phoneNumber,
      this.name,
      this.phonenumber,
      this.status,
      this.image,
      this.token,
      this.notificationToken,
      this.imageBype,
      this.driverId,
      this.carType,
      this.price,
      this.category,
      this.region,
      this.company});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    phonenumber = json['phonenumber'];
    status = json['status'];
    image = json['image'];
    token = json['token'];
    notificationToken = json['notificationToken'];
    imageBype = json['imageBype'];
    driverId = json['driverId'];
    carType = json['carType'];
    price = json['price'];
    category = json['category'];
    region = json['region'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    data['phonenumber'] = phonenumber;
    data['status'] = status;
    data['image'] = image;
    data['token'] = token;
    data['notificationToken'] = notificationToken;
    data['imageBype'] = imageBype;
    data['driverId'] = driverId;
    data['carType'] = carType;
    data['price'] = price;
    data['category'] = category;
    data['region'] = region;
    data['company'] = company;
    return data;
  }
}
