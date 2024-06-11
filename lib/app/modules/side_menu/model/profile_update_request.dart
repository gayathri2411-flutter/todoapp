class Profile_Update_Request {
  String? address;
  String? carType;
  String? category;
  String? code;
  String? deviceId;
  String? domain;
  String? email;
  String? firstName;
  String? id;
  String? lang;
  String? lastName;
  String? latitude;
  String? loginStatus;
  String? longitude;
  String? password;
  String? phoneNumber;
  String? phoneVerified;
  int? price;
  String? restKey;
  String? role;
  String? status;
  String? token;
  String? website;

  Profile_Update_Request(
      {this.address,
      this.carType,
      this.category,
      this.code,
      this.deviceId,
      this.domain,
      this.email,
      this.firstName,
      this.id,
      this.lang,
      this.lastName,
      this.latitude,
      this.loginStatus,
      this.longitude,
      this.password,
      this.phoneNumber,
      this.phoneVerified,
      this.price,
      this.restKey,
      this.role,
      this.status,
      this.token,
      this.website});

  Profile_Update_Request.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    carType = json['carType'];
    category = json['category'];
    code = json['code'];
    deviceId = json['deviceId'];
    domain = json['domain'];
    email = json['email'];
    firstName = json['firstName'];
    id = json['id'];
    lang = json['lang'];
    lastName = json['lastName'];
    latitude = json['latitude'];
    loginStatus = json['loginStatus'];
    longitude = json['longitude'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    phoneVerified = json['phoneVerified'];
    price = json['price'];
    restKey = json['restKey'];
    role = json['role'];
    status = json['status'];
    token = json['token'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['address'] = address;
    data['carType'] = carType;
    data['category'] = category;
    data['code'] = code;
    data['deviceId'] = deviceId;
    data['domain'] = domain;
    data['email'] = email;
    data['firstName'] = firstName;
    data['id'] = id;
    data['lang'] = lang;
    data['lastName'] = lastName;
    data['latitude'] = latitude;
    data['loginStatus'] = loginStatus;
    data['longitude'] = longitude;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['phoneVerified'] = phoneVerified;
    data['price'] = price;
    data['restKey'] = restKey;
    data['role'] = role;
    data['status'] = status;
    data['token'] = token;
    data['website'] = website;
    return data;
  }
}
