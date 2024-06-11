class TripHistoryResponse {
  int? statusCode;
  bool? status;
  String? message;
  List<TripData>? data;
  String? jwt;
  int? infoId;

  TripHistoryResponse({
    this.statusCode,
    this.status,
    this.message,
    this.data,
    this.jwt,
    this.infoId,
  });

  TripHistoryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'] as int?;
    status = json['status'] as bool?;
    message = json['message'] as String?;
    if (json['data'] != null) {
      data = <TripData>[];
      json['data'].forEach((v) {
        data!.add(TripData.fromJson(v as Map<String, dynamic>));
      });
    }
    jwt = json['jwt'] as String?;
    infoId = json['infoId'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['jwt'] = jwt;
    data['infoId'] = infoId;
    return data;
  }
}

class TripData {
  // Define the properties of TripData according to your requirements
  // Example properties
  int? tripId;
  String? destination;

  TripData({
    this.tripId,
    this.destination,
  });

  TripData.fromJson(Map<String, dynamic> json) {
    tripId = json['tripId'] as int?;
    destination = json['destination'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tripId'] = tripId;
    data['destination'] = destination;
    return data;
  }
}
