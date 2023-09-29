import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences? _preferences;

  static const _isLOGIN = "is_login";
  static const _userID = "user_id";
  static const _userNAME = "user_name";
  static const _userEMAIL = "email";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static dynamic setUserLoggedIn(bool isLogin) {
    _preferences!.setBool(_isLOGIN, isLogin);
  }

  static dynamic isLoggedIn() {
    return _preferences!.getBool(_isLOGIN) ?? false;
  }

  static dynamic setUserID(String userId) {
    _preferences!.setString(_userID, userId);
  }

  static dynamic getUserId() {
    return _preferences!.getString(_userID);
  }

  static dynamic setUserName(String userName) {
    _preferences!.setString(_userNAME, userName);
  }

  static dynamic getUserName() {
    return _preferences!.getString(_userNAME);
  }

  static dynamic setUserEmail(String email) {
    _preferences!.setString(_userEMAIL, email);
  }

  static dynamic getUserEmail() {
    return _preferences!.getString(_userEMAIL);
  }


  static dynamic logout() {
    _preferences!.remove(_userEMAIL);
    _preferences!.remove(_userNAME);
    _preferences!.remove(_userID);
    _preferences!.remove(_isLOGIN);
  }
}
