// ignore_for_file: file_names, prefer_typing_uninitialized_variables

class ForgotPasswordResendOtpResponse {
  int? statusCode;
  bool? status;
  String? message;
  String? data;
  var jwt;
  int? infoId;

  ForgotPasswordResendOtpResponse(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.jwt,
      this.infoId});

  ForgotPasswordResendOtpResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'];
    jwt = json['jwt'];
    infoId = json['infoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    data['jwt'] = jwt;
    data['infoId'] = infoId;
    return data;
  }
}
