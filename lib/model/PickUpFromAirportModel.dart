class PickUpFromAirportModel {
  String? massage;
  String? status;
  List<SearchCarData>? searchCarData;

  PickUpFromAirportModel({this.massage, this.status, this.searchCarData});

  PickUpFromAirportModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    status = json['status'];
    if (json['search_car_data'] != null) {
      searchCarData = <SearchCarData>[];
      json['search_car_data'].forEach((v) {
        searchCarData!.add(new SearchCarData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['status'] = this.status;
    if (this.searchCarData != null) {
      data['search_car_data'] =
          this.searchCarData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchCarData {
  String? subCatName;
  String? catName;
  String? carId;
  String? userId;
  String? trip;
  String? package;
  String? returnDate;
  String? returnTime;
  String? fromLat;
  String? fromLong;
  String? customerName;
  String? pickUpDate;
  String? pickUpTime;
  String? from;
  String? carName;
  String? carPrice;
  String? carKM;

  SearchCarData(
      {this.subCatName,
        this.catName,
        this.carId,
        this.userId,
        this.trip,
        this.package,
        this.returnDate,
        this.returnTime,
        this.fromLat,
        this.fromLong,
        this.customerName,
        this.pickUpDate,
        this.pickUpTime,
        this.from,
        this.carName,
        this.carPrice,
        this.carKM});

  SearchCarData.fromJson(Map<String, dynamic> json) {
    subCatName = json['sub_cat_name'];
    catName = json['cat_name'];
    carId = json['car_id'];
    userId = json['user_id'];
    trip = json['trip'];
    package = json['package'];
    returnDate = json['return_date'];
    returnTime = json['return_time'];
    fromLat = json['from_lat'];
    fromLong = json['from_long'];
    customerName = json['customer_name'];
    pickUpDate = json['pick_up_date'];
    pickUpTime = json['pick_up_time'];
    from = json['from'];
    carName = json['carName'];
    carPrice = json['carPrice'];
    carKM = json['carKM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_cat_name'] = this.subCatName;
    data['cat_name'] = this.catName;
    data['car_id'] = this.carId;
    data['user_id'] = this.userId;
    data['trip'] = this.trip;
    data['package'] = this.package;
    data['return_date'] = this.returnDate;
    data['return_time'] = this.returnTime;
    data['from_lat'] = this.fromLat;
    data['from_long'] = this.fromLong;
    data['customer_name'] = this.customerName;
    data['pick_up_date'] = this.pickUpDate;
    data['pick_up_time'] = this.pickUpTime;
    data['from'] = this.from;
    data['carName'] = this.carName;
    data['carPrice'] = this.carPrice;
    data['carKM'] = this.carKM;
    return data;
  }
}