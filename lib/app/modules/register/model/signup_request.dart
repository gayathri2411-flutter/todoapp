// ignore_for_file: prefer_typing_uninitialized_variables

class SignUpRequest {
  String? carType;
  String? category;
  String? domain;
  String? email;
  String? firstName;
  String? id;
  String? lastName;
  var latitude;
  var longitude;
  String? password;
  String? phoneNumber;
  String? phoneVerified;
  String? role;
  String? website;

  SignUpRequest(
      {this.carType,
      this.category,
      this.domain,
      this.email,
      this.firstName,
      this.id,
      this.lastName,
      this.latitude,
      this.longitude,
      this.password,
      this.phoneNumber,
      this.phoneVerified,
      this.role,
      this.website});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    carType = json['carType'];
    category = json['category'];
    domain = json['domain'];
    email = json['email'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    phoneVerified = json['phoneVerified'];
    role = json['role'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carType'] = carType;
    data['category'] = category;
    data['domain'] = domain;
    data['email'] = email;
    data['firstName'] = firstName;
    data['id'] = id;
    data['lastName'] = lastName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['phoneVerified'] = phoneVerified;
    data['role'] = role;
    data['website'] = website;
    return data;
  }
}
