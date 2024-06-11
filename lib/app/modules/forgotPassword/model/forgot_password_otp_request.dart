class ForgotPasswordRequest {
  String? companyName;
  String? countryCode;
  String? password;
  String? phoneNumber;
  String? rideId;
  String? role;
  String? token;
  String? userId;

  ForgotPasswordRequest(
      {this.companyName,
      this.countryCode,
      this.password,
      this.phoneNumber,
      this.rideId,
      this.role,
      this.token,
      this.userId});

  ForgotPasswordRequest.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    countryCode = json['countryCode'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    rideId = json['rideId'];
    role = json['role'];
    token = json['token'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['companyName'] = companyName;
    data['countryCode'] = countryCode;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['rideId'] = rideId;
    data['role'] = role;
    data['token'] = token;
    data['userId'] = userId;
    return data;
  }
}
