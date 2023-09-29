import 'dart:convert';
import 'dart:io';
import 'package:car_bulao/Api/Api.Network.dart';
import 'package:car_bulao/model/BookingCancelModel.dart';
import 'package:car_bulao/model/OneWayModel.dart';
import 'package:car_bulao/model/UpdateProfileModel.dart';
import 'package:http/http.dart' as http;
import '../model/ContactUsModel.dart';
import '../model/DropToAirportModel.dart';
import '../model/LocalModel.dart';
import '../model/LoginModel.dart';
import '../model/MyProfileModel.dart';
import '../model/PickUpFromAirportModel.dart';
import '../model/PrivacyModel.dart';
import '../model/RoundTripModel.dart';
import '../model/SignUpModel.dart';
import '../model/editProfileModel.dart';

class ApiHelper {
  Future<SignUpModel> signUp(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(ApiNetwork.signUp);

    try {
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        return SignUpModel.fromJson(jsonDecode(response.body));
      } else {
        return SignUpModel(message: 'Something went wrong!');
      }
    } catch (e) {
      return SignUpModel(message: 'Something went wrong!');
    }
  }

  Future<LoginModel> login(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(ApiNetwork.login);
    try {
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        return LoginModel(message: 'Something went wrong!');
      }
    } catch (e) {
      return LoginModel(message: 'Something went wrong!');
    }
  }

  Future<OneWayModel> oneWay(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(ApiNetwork.oneway);

    try {
      final response = await http.post(uri, body: map);

      if (response.statusCode == 200) {
        return OneWayModel.fromJson(jsonDecode(response.body));
      } else {
        return OneWayModel(massage: 'Somthing went wrong');
      }
    } catch (e) {
      return OneWayModel(massage: 'Something went wrong!');
    }
  }

  Future<LocalModel> local(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(ApiNetwork.local);

    try {
      final response = await http.post(uri, body: map);

      if (response.statusCode == 200) {
        return LocalModel.fromJson(jsonDecode(response.body));
      } else {
        return LocalModel(massage: 'Somthing went wrong');
      }
    } catch (e) {
      return LocalModel(massage: 'Somthing went wrong');
    }
  }

  Future<PickUpFromAirportModel> pickFromAirport(
      Map<String, dynamic> map) async {
    Uri uri = Uri.parse(ApiNetwork.pickupFromairport);

    try {
      final response = await http.post(uri, body: map);

      if (response.statusCode == 200) {
        return PickUpFromAirportModel.fromJson(jsonDecode(response.body));
      } else {
        return PickUpFromAirportModel(massage: 'Somthing went wrong!!!');
      }
    } catch (e) {
      return PickUpFromAirportModel(massage: 'Somthing went wrong!!!');
    }
  }

  Future<BookingCancelModel> bookingCancel(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(ApiNetwork.cancel);
    try {
      final response = await http.post(uri, body: map);

      if (response.statusCode == 200) {
        return BookingCancelModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Something went wrong!!!');
      }
    } catch (e) {
      throw Exception('Something went wrong!!!');
    }
  }

  Future<RoundTripModel> roundTripinsert(Map<String, dynamic> map) async {
    Uri uri = Uri.parse(ApiNetwork.roundTrip);

    try {
      final response = await http.post(uri, body: map);
      if (response.statusCode == 200) {
        return RoundTripModel.fromJson(jsonDecode(response.body));
      } else {
        return RoundTripModel(massage: "Somthing Went wrong");
      }
    } catch (e) {
      return RoundTripModel(massage: "SOmthing went wrong");
    }
  }

  Future<DropToAirportModel> dropToAirport(Map<String, dynamic> map) async {
    Uri url = Uri.parse(ApiNetwork.dropToAirport);

    try {
      final response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        return DropToAirportModel.fromJson(jsonDecode(response.body));
      } else {
        return DropToAirportModel(massage: "Somthing went wrong");
      }
    } catch (e) {
      return DropToAirportModel(massage: "Somthing went wrong");
    }
  }

  Future<MyProfileModel> getProfile(Map<String, dynamic> map) async {
    Uri url = Uri.parse(ApiNetwork.myProfile);

    try {
      final response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        return MyProfileModel.fromJson(jsonDecode(response.body));
      } else {
        return MyProfileModel(message: "Somthing went wrong");
      }
    } catch (e) {
      return MyProfileModel(message: "Somthing went wrong");
    }
  }

  Future<editProfileModel> editProfile(Map<String, dynamic> map) async {
    Uri url = Uri.parse(ApiNetwork.editProfile);

    try {
      final response = await http.post(url, body: map);

      if (response.statusCode == 200) {
        return editProfileModel.fromJson(jsonDecode(response.body));
      } else {
        return editProfileModel(message: "Somthing went wrong");
      }
    } catch (e) {
      return editProfileModel(message: "Somthing went wrong");
    }
  }

  Future<PrivacyModel> privacy() async {
    Uri url = Uri.parse(ApiNetwork.privacy);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return PrivacyModel.fromJson(jsonDecode(response.body));
      } else {
        return PrivacyModel(message: "Somthing went wrong");
      }
    } catch (e) {
      return PrivacyModel(message: "Somthing went wrong");
    }
  }

  Future<ContactUsModel> contactUs(Map<String, dynamic> map) async {
    Uri url = Uri.parse(ApiNetwork.contactUs);

    try {
      final response = await http.post(url, body: map);
      if (response.statusCode == 200) {
        return ContactUsModel.fromJson(jsonDecode(response.body));
      } else {
        return ContactUsModel(message: "Somthing went wrong Try again...");
      }
    } catch (e) {
      return ContactUsModel(message: "Somthing went wrong Try again...");
    }
  }
}
