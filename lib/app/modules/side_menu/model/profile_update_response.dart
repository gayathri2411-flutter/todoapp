// ignore_for_file: camel_case_types

class Profile_Update_Response {
  int? statusCode;
  bool? status;
  String? message;
  var data;
  var jwt;
  int? infoId;

  Profile_Update_Response(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.jwt,
      this.infoId});

  Profile_Update_Response.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'];
    jwt = json['jwt'];
    infoId = json['infoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    data['jwt'] = jwt;
    data['infoId'] = infoId;
    return data;
  }
}
