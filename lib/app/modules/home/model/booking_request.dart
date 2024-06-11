class Booking_Request {
  String? action;
  String? category;
  String? coupen;
  String? des;
  String? driverId;
  String? isAndroid;
  String? km;
  String? latitude;
  String? longitude;
  String? message;
  String? paymentType;
  String? phoneNumber;
  String? rideKeyLocal;
  String? source;
  String? title;
  String? token;
  String? topic;
  String? tripId;
  String? userId;
  String? userToken;

  Booking_Request(
      {this.action,
      this.category,
      this.coupen,
      this.des,
      this.driverId,
      this.isAndroid,
      this.km,
      this.latitude,
      this.longitude,
      this.message,
      this.paymentType,
      this.phoneNumber,
      this.rideKeyLocal,
      this.source,
      this.title,
      this.token,
      this.topic,
      this.tripId,
      this.userId,
      this.userToken});

  Booking_Request.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    category = json['category'];
    coupen = json['coupen'];
    des = json['des'];
    driverId = json['driverId'];
    isAndroid = json['isAndroid'];
    km = json['km'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    message = json['message'];
    paymentType = json['paymentType'];
    phoneNumber = json['phoneNumber'];
    rideKeyLocal = json['rideKeyLocal'];
    source = json['source'];
    title = json['title'];
    token = json['token'];
    topic = json['topic'];
    tripId = json['tripId'];
    userId = json['userId'];
    userToken = json['userToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['action'] = action;
    data['category'] = category;
    data['coupen'] = coupen;
    data['des'] = des;
    data['driverId'] = driverId;
    data['isAndroid'] = isAndroid;
    data['km'] = km;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['message'] = message;
    data['paymentType'] = paymentType;
    data['phoneNumber'] = phoneNumber;
    data['rideKeyLocal'] = rideKeyLocal;
    data['source'] = source;
    data['title'] = title;
    data['token'] = token;
    data['topic'] = topic;
    data['tripId'] = tripId;
    data['userId'] = userId;
    data['userToken'] = userToken;
    return data;
  }
}
