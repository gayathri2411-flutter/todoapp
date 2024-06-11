class FeedBackRequest {
  String? carType;
  String? destination;
  String? email;
  String? endDate;
  String? id;
  String? job;
  String? message;
  String? name;
  String? phonenumber;
  String? senderMail;
  String? source;
  String? startDate;
  String? subject;
  String? taxiId;

  FeedBackRequest(
      {this.carType,
      this.destination,
      this.email,
      this.endDate,
      this.id,
      this.job,
      this.message,
      this.name,
      this.phonenumber,
      this.senderMail,
      this.source,
      this.startDate,
      this.subject,
      this.taxiId});

  FeedBackRequest.fromJson(Map<String, dynamic> json) {
    carType = json['carType'];
    destination = json['destination'];
    email = json['email'];
    endDate = json['endDate'];
    id = json['id'];
    job = json['job'];
    message = json['message'];
    name = json['name'];
    phonenumber = json['phonenumber'];
    senderMail = json['senderMail'];
    source = json['source'];
    startDate = json['startDate'];
    subject = json['subject'];
    taxiId = json['taxiId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carType'] = carType;
    data['destination'] = destination;
    data['email'] = email;
    data['endDate'] = endDate;
    data['id'] = id;
    data['job'] = job;
    data['message'] = message;
    data['name'] = name;
    data['phonenumber'] = phonenumber;
    data['senderMail'] = senderMail;
    data['source'] = source;
    data['startDate'] = startDate;
    data['subject'] = subject;
    data['taxiId'] = taxiId;
    return data;
  }
}
