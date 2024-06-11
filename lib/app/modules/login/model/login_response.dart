// ignore_for_file: prefer_typing_uninitialized_variables

class LoginResponse {
  var statusCode;
  bool? status;
  String? message;
  Data? data;
  String? jwt;
  var infoId;

  LoginResponse(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.jwt,
      this.infoId});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    jwt = json['jwt'];
    infoId = json['infoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['jwt'] = jwt;
    data['infoId'] = infoId;
    return data;
  }
}

class Data {
  String? id;
  var supplierId;
  String? role;
  var taxiId;
  String? lan;
  var hourly;
  var price;
  var peakPrice;
  var basePrice;
  String? token;
  var status;
  var isApproved;
  var type;
  String? phoneNumber;
  String? email;
  var isImage;
  String? name;
  var oneSignalValue;

  Data(
      {this.id,
      this.supplierId,
      this.role,
      this.taxiId,
      this.lan,
      this.hourly,
      this.price,
      this.peakPrice,
      this.basePrice,
      this.token,
      this.status,
      this.isApproved,
      this.type,
      this.phoneNumber,
      this.email,
      this.isImage,
      this.name,
      this.oneSignalValue});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierId = json['supplierId'];
    role = json['role'];
    taxiId = json['taxiId'];
    lan = json['lan'];
    hourly = json['hourly'];
    price = json['price'];
    peakPrice = json['peakPrice'];
    basePrice = json['basePrice'];
    token = json['token'];
    status = json['status'];
    isApproved = json['isApproved'];
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    isImage = json['isImage'];
    name = json['name'];
    oneSignalValue = json['oneSignalValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['supplierId'] = supplierId;
    data['role'] = role;
    data['taxiId'] = taxiId;
    data['lan'] = lan;
    data['hourly'] = hourly;
    data['price'] = price;
    data['peakPrice'] = peakPrice;
    data['basePrice'] = basePrice;
    data['token'] = token;
    data['status'] = status;
    data['isApproved'] = isApproved;
    data['type'] = type;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['isImage'] = isImage;
    data['name'] = name;
    data['oneSignalValue'] = oneSignalValue;
    return data;
  }
}
