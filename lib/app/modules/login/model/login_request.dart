class LoginRequest {
  String? domain;
  String? email;
  String? password;
  String? phoneNumber;
  String? token;

  LoginRequest(
      {this.domain, this.email, this.password, this.phoneNumber, this.token});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['domain'] = domain;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['token'] = token;
    return data;
  }
}
