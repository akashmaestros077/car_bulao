class MyProfileModel {
  EditProfile? editProfile;
  String? status;
  String? message;

  MyProfileModel({this.editProfile, this.status, this.message});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    editProfile = json['edit_profile'] != null
        ? EditProfile.fromJson(json['edit_profile'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (editProfile != null) {
      data['edit_profile'] = editProfile!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class EditProfile {
  String? name;
  String? mobile;
  String? email;
  String? dateOfB;
  String? gender;
  String? img;

  EditProfile(
      {this.name,
        this.mobile,
        this.email,
        this.dateOfB,
        this.gender,
        this.img});

  EditProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    dateOfB = json['date_of_b'];
    gender = json['gender'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['date_of_b'] = dateOfB;
    data['gender'] = gender;
    data['img'] = img;
    return data;
  }
}