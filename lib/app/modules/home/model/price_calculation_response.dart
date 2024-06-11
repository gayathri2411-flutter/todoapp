// ignore_for_file: prefer_typing_uninitialized_variables

class PriceCalculationResponse {
  var statusCode;
  bool? status;
  var message;
  Data? data;
  var jwt;
  var infoId;

  PriceCalculationResponse(
      {this.statusCode,
      this.status,
      this.message,
      this.data,
      this.jwt,
      this.infoId});

  PriceCalculationResponse.fromJson(Map<String, dynamic> json) {
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
  var type;
  var region;
  var base;
  var time;
  var basePrice;
  var baseTime;
  var baseAddPrice;
  var price;
  var kmTwo;
  var priceTwo;
  var waitTimeTwo;
  var kmThree;
  var priceThree;
  var waitTimeThree;
  var travelTime;
  var waitTime;
  var minimumFare;
  var totalTravelTime;
  var totalWaitTime;
  var userTotalPrice;
  var userTravelPrice;
  var totalPrice;
  var estimateTime;
  var km;
  var kmFour;
  var priceFour;
  var waitingTimeFour;
  var kmFive;
  var priceFive;
  var waitingTimeFive;
  var kmSix;
  var priceSix;
  var waitingTimeSix;
  var percentage;
  var discountCoupan;
  var tax;
  var discount;
  var totalWaitTimePrice;
  var baseKm;
  var realKm;
  var elapsedTime;
  var originalDistance;

  Data(
      {this.type,
      this.region,
      this.base,
      this.time,
      this.basePrice,
      this.baseTime,
      this.baseAddPrice,
      this.price,
      this.kmTwo,
      this.priceTwo,
      this.waitTimeTwo,
      this.kmThree,
      this.priceThree,
      this.waitTimeThree,
      this.travelTime,
      this.waitTime,
      this.minimumFare,
      this.totalTravelTime,
      this.totalWaitTime,
      this.userTotalPrice,
      this.userTravelPrice,
      this.totalPrice,
      this.estimateTime,
      this.km,
      this.kmFour,
      this.priceFour,
      this.waitingTimeFour,
      this.kmFive,
      this.priceFive,
      this.waitingTimeFive,
      this.kmSix,
      this.priceSix,
      this.waitingTimeSix,
      this.percentage,
      this.discountCoupan,
      this.tax,
      this.discount,
      this.totalWaitTimePrice,
      this.baseKm,
      this.realKm,
      this.elapsedTime,
      this.originalDistance});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    region = json['region'];
    base = json['base'];
    time = json['time'];
    basePrice = json['basePrice'];
    baseTime = json['baseTime'];
    baseAddPrice = json['baseAddPrice'];
    price = json['price'];
    kmTwo = json['kmTwo'];
    priceTwo = json['priceTwo'];
    waitTimeTwo = json['waitTimeTwo'];
    kmThree = json['kmThree'];
    priceThree = json['priceThree'];
    waitTimeThree = json['waitTimeThree'];
    travelTime = json['travelTime'];
    waitTime = json['waitTime'];
    minimumFare = json['minimumFare'];
    totalTravelTime = json['totalTravelTime'];
    totalWaitTime = json['totalWaitTime'];
    userTotalPrice = json['userTotalPrice'];
    userTravelPrice = json['userTravelPrice'];
    totalPrice = json['totalPrice'];
    estimateTime = json['estimateTime'];
    km = json['km'];
    kmFour = json['kmFour'];
    priceFour = json['priceFour'];
    waitingTimeFour = json['waitingTimeFour'];
    kmFive = json['kmFive'];
    priceFive = json['priceFive'];
    waitingTimeFive = json['waitingTimeFive'];
    kmSix = json['kmSix'];
    priceSix = json['priceSix'];
    waitingTimeSix = json['waitingTimeSix'];
    percentage = json['percentage'];
    discountCoupan = json['discountCoupan'];
    tax = json['tax'];
    discount = json['discount'];
    totalWaitTimePrice = json['totalWaitTimePrice'];
    baseKm = json['baseKm'];
    realKm = json['realKm'];
    elapsedTime = json['elapsedTime'];
    originalDistance = json['originalDistance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['region'] = region;
    data['base'] = base;
    data['time'] = time;
    data['basePrice'] = basePrice;
    data['baseTime'] = baseTime;
    data['baseAddPrice'] = baseAddPrice;
    data['price'] = price;
    data['kmTwo'] = kmTwo;
    data['priceTwo'] = priceTwo;
    data['waitTimeTwo'] = waitTimeTwo;
    data['kmThree'] = kmThree;
    data['priceThree'] = priceThree;
    data['waitTimeThree'] = waitTimeThree;
    data['travelTime'] = travelTime;
    data['waitTime'] = waitTime;
    data['minimumFare'] = minimumFare;
    data['totalTravelTime'] = totalTravelTime;
    data['totalWaitTime'] = totalWaitTime;
    data['userTotalPrice'] = userTotalPrice;
    data['userTravelPrice'] = userTravelPrice;
    data['totalPrice'] = totalPrice;
    data['estimateTime'] = estimateTime;
    data['km'] = km;
    data['kmFour'] = kmFour;
    data['priceFour'] = priceFour;
    data['waitingTimeFour'] = waitingTimeFour;
    data['kmFive'] = kmFive;
    data['priceFive'] = priceFive;
    data['waitingTimeFive'] = waitingTimeFive;
    data['kmSix'] = kmSix;
    data['priceSix'] = priceSix;
    data['waitingTimeSix'] = waitingTimeSix;
    data['percentage'] = percentage;
    data['discountCoupan'] = discountCoupan;
    data['tax'] = tax;
    data['discount'] = discount;
    data['totalWaitTimePrice'] = totalWaitTimePrice;
    data['baseKm'] = baseKm;
    data['realKm'] = realKm;
    data['elapsedTime'] = elapsedTime; 
    data['originalDistance'] = originalDistance;
    return data;
  }
}
