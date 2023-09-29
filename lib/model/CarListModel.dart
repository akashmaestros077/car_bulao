class CarListModel {
  List<Data>? data;
  String? message;

  CarListModel({this.data, this.message});

  CarListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? image;
  String? strtotime;
  String? price;
  String? km;
  String? path;

  Data(
      {this.id,
        this.name,
        this.image,
        this.strtotime,
        this.price,
        this.km,
        this.path});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    strtotime = json['strtotime'];
    price = json['price'];
    km = json['km'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['strtotime'] = strtotime;
    data['price'] = price;
    data['km'] = km;
    data['path'] = path;
    return data;
  }
}
