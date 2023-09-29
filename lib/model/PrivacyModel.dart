class PrivacyModel {
  PrivacyData? privacyData;
  String? status;
  String? message;

  PrivacyModel({this.privacyData, this.status, this.message});

  PrivacyModel.fromJson(Map<String, dynamic> json) {
    privacyData = json['privacy_data'] != null
        ? PrivacyData.fromJson(json['privacy_data'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (privacyData != null) {
      data['privacy_data'] = privacyData!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class PrivacyData {
  String? description;

  PrivacyData({this.description});

  PrivacyData.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    return data;
  }
}
