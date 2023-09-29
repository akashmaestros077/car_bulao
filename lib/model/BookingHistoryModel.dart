class BookingHistoryModel {
  String? result;
  String? message;
  List<Data>? data;

  BookingHistoryModel({this.result, this.message, this.data});

  BookingHistoryModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? carId;
  String? trip;
  Null? package;
  String? from;
  String? to;
  String? pickUpDate;
  String? pickUpTime;
  Null? returnDate;
  Null? returnTime;
  String? bookingDate;
  String? fromLat;
  String? fromLong;
  String? toLat;
  String? toLong;
  Null? customerName;
  Null? phoneNumber;
  String? orderStatus;
  String? cancelStatus;
  String? path;

  Data(
      {this.id,
        this.userId,
        this.carId,
        this.trip,
        this.package,
        this.from,
        this.to,
        this.pickUpDate,
        this.pickUpTime,
        this.returnDate,
        this.returnTime,
        this.bookingDate,
        this.fromLat,
        this.fromLong,
        this.toLat,
        this.toLong,
        this.customerName,
        this.phoneNumber,
        this.orderStatus,
        this.cancelStatus,
        this.path});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    carId = json['car_id'];
    trip = json['trip'];
    package = json['package'];
    from = json['from'];
    to = json['to'];
    pickUpDate = json['pick_up_date'];
    pickUpTime = json['pick_up_time'];
    returnDate = json['return_date'];
    returnTime = json['return_time'];
    bookingDate = json['booking_date'];
    fromLat = json['from_lat'];
    fromLong = json['from_long'];
    toLat = json['to_lat'];
    toLong = json['to_long'];
    customerName = json['customer_name'];
    phoneNumber = json['phone_number'];
    orderStatus = json['order_status'];
    cancelStatus = json['cancel_status'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['car_id'] = this.carId;
    data['trip'] = this.trip;
    data['package'] = this.package;
    data['from'] = this.from;
    data['to'] = this.to;
    data['pick_up_date'] = this.pickUpDate;
    data['pick_up_time'] = this.pickUpTime;
    data['return_date'] = this.returnDate;
    data['return_time'] = this.returnTime;
    data['booking_date'] = this.bookingDate;
    data['from_lat'] = this.fromLat;
    data['from_long'] = this.fromLong;
    data['to_lat'] = this.toLat;
    data['to_long'] = this.toLong;
    data['customer_name'] = this.customerName;
    data['phone_number'] = this.phoneNumber;
    data['order_status'] = this.orderStatus;
    data['cancel_status'] = this.cancelStatus;
    data['path'] = this.path;
    return data;
  }
}