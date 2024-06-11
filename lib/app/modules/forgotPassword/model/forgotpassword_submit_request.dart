class ForgotPasswordSubmitRequest {
  String? countryCode;
  String? password;
  String? phoneNumber;
  String? rideId;
  String? role;
  String? token;
  String? userId;

  ForgotPasswordSubmitRequest(
      {this.countryCode,
      this.password,
      this.phoneNumber,
      this.rideId,
      this.role,
      this.token,
      this.userId});

  ForgotPasswordSubmitRequest.fromJson(Map<String, dynamic> json) {
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
