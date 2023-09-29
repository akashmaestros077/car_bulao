class RoundTripModel {
  String? massage;
  String? status;
  List<SearchCarData>? searchCarData;

  RoundTripModel({this.massage, this.status, this.searchCarData});

  RoundTripModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    status = json['status'];
    if (json['search_car_data'] != null) {
      searchCarData = <SearchCarData>[];
      json['search_car_data'].forEach((v) {
        searchCarData!.add(SearchCarData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['massage'] = massage;
    data['status'] = status;
    if (searchCarData != null) {
      data['search_car_data'] =
          searchCarData!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_cat_name'] = subCatName;
    data['cat_name'] = catName;
    data['car_id'] = carId;
    data['user_id'] = userId;
    data['trip'] = trip;
    data['package'] = package;
    data['return_date'] = returnDate;
    data['return_time'] = returnTime;
    data['from_lat'] = fromLat;
    data['from_long'] = fromLong;
    data['customer_name'] = customerName;
    data['pick_up_date'] = pickUpDate;
    data['pick_up_time'] = pickUpTime;
    data['from'] = from;
    data['carName'] = carName;
    data['carPrice'] = carPrice;
    data['carKM'] = carKM;
    return data;
  }
}