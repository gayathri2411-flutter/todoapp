// ignore_for_file: prefer_typing_uninitialized_variables, file_names

class UserDetailsResponse {
  var statusCode;
  bool? status;
  var message;
  Data? data;
  var jwt;
  var infoId;

  UserDetailsResponse(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.jwt,
      this.infoId});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
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
  var id;
  var email;
  var firstName;
  var lastName;
  var password;
  var phoneNumber;
  var address;
  var role;
  var restKey;
  var lang;
  var latitude;
  var longitude;
  var code;
  var deviceId;
  var website;
  var carType;
  var token;
  var loginStatus;
  var status;
  var phoneVerified;
  var price;
  var domain;
  var category;

  Data(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.phoneNumber,
      this.address,
      this.role,
      this.restKey,
      this.lang,
      this.latitude,
      this.longitude,
      this.code,
      this.deviceId,
      this.website,
      this.carType,
      this.token,
      this.loginStatus,
      this.status,
      this.phoneVerified,
      this.price,
      this.domain,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    role = json['role'];
    restKey = json['restKey'];
    lang = json['lang'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    code = json['code'];
    deviceId = json['deviceId'];
    website = json['website'];
    carType = json['carType'];
    token = json['token'];
    loginStatus = json['loginStatus'];
    status = json['status'];
    phoneVerified = json['phoneVerified'];
    price = json['price'];
    domain = json['domain'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    data['role'] = role;
    data['restKey'] = restKey;
    data['lang'] = lang;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['code'] = code;
    data['deviceId'] = deviceId;
    data['website'] = website;
    data['carType'] = carType;
    data['token'] = token;
    data['loginStatus'] = loginStatus;
    data['status'] = status;
    data['phoneVerified'] = phoneVerified;
    data['price'] = price;
    data['domain'] = domain;
    data['category'] = category;
    return data;
  }
}
