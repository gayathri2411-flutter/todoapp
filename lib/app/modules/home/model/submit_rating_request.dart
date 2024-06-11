  class SubmitRatingRequest {
  String? comment;
  String? driverId;
  String? formattedDate;
  String? id;
  String? postedBy;
  int? rating; 
  String? rideId;
  String? taxiDetailId;
  String? updatedOn;
  String? userFullName;
  String? userId; 

  SubmitRatingRequest(
      {this.comment,
      this.driverId,
      this.formattedDate,
      this.id,
      this.postedBy,
      this.rating,
      this.rideId,
      this.taxiDetailId,
      this.updatedOn,
      this.userFullName,
      this.userId});

  SubmitRatingRequest.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    driverId = json['driverId'];
    formattedDate = json['formattedDate'];
    id = json['id'];
    postedBy = json['postedBy'];
    rating = json['rating'];
    rideId = json['rideId'];
    taxiDetailId = json['taxiDetailId'];
    updatedOn = json['updatedOn'];
    userFullName = json['userFullName'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['driverId'] = driverId;
    data['formattedDate'] = formattedDate;
    data['id'] = id;
    data['postedBy'] = postedBy;
    data['rating'] = rating;
    data['rideId'] = rideId;
    data['taxiDetailId'] = taxiDetailId;
    data['updatedOn'] = updatedOn;
    data['userFullName'] = userFullName;
    data['userId'] = userId;
    return data;
  }
}
