class LoginModel {
  String? status;
  String? message;
  UserData? userData;

  LoginModel({this.status, this.message, this.userData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user-data'] != null
        ? UserData.fromJson(json['user-data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userData != null) {
      data['user-data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? name;
  String? email;
  String? mobile;

  UserData({this.id, this.name, this.email, this.mobile});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    return data;
  }
}
