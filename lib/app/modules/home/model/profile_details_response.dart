// ignore_for_file: camel_case_types

class Profile_Details_Response {
  int? statusCode;
  bool? status;
  var message;
  Data? data;
  var jwt;
  int? infoId;

  Profile_Details_Response(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.jwt,
      this.infoId});

  Profile_Details_Response.fromJson(Map<String, dynamic> json) {
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
  String? isImage;
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? lang;
  var latitude;
 var longitude;
  String? phoneNumber;
  String? domain;
  String? role;
  var phoneVerified;

  Data(
      {this.isImage,
      this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.lang,
      this.latitude,
      this.longitude,
      this.phoneNumber,
      this.domain,
      this.role,
      this.phoneVerified});

  Data.fromJson(Map<String, dynamic> json) {
    isImage = json['isImage'];
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    lang = json['lang'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phoneNumber = json['phoneNumber'];
    domain = json['domain'];
    role = json['role'];
    phoneVerified = json['phoneVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['isImage'] = isImage;
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['lang'] = lang;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phoneNumber'] = phoneNumber;
    data['domain'] = domain;
    data['role'] = role;
    data['phoneVerified'] = phoneVerified;
    return data;
  }
}
