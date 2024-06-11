class AdvanceSearch_v1_Response {
  int? statusCode;
  bool? status;
  String? message;
  List<Data>? data;
  var jwt;
  int? infoId;

  AdvanceSearch_v1_Response(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.jwt,
      this.infoId});

  AdvanceSearch_v1_Response.fromJson(Map<String, dynamic> json) {
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
  var id;
  var latitude;
  var longitude;
  var phoneNumber;
  var name;
  var phonenumber;
  var status;
  var image;
  var token;
  var notificationToken;
  var imageBype;
  var driverId;
  var carType;
  var price;
  var category;
  var region;

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
      this.region});

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
    return data;
  }
}
