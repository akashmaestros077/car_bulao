class ApiNetwork {
  static const String baseUrl = "http://carbulao.com/api/process.php?action";
  static const String baseUrl_2 = "http://www.carbulao.com/api2";

  static const String signUp = "$baseUrl_2/user_register.php";
  static const String login = "$baseUrl_2/user_login.php";
  static const String roundTrip = "$baseUrl_2/round_trip_insert.php";
  static const String myProfile = "$baseUrl_2/edit_profile.php";
  static const String editProfile = "http://www.carbulao.com/api2/update_profile.php";
  static const String privacy = "$baseUrl_2/privacy.php";
  static const String contactUs = "$baseUrl_2/user_contact.php";
  static const String pickupFromairport = "$baseUrl_2/pick_up_from_airport.php";
  static const String oneway = "$baseUrl_2/car_one_way.php";
  static const String local = "$baseUrl_2/local.php";
  static const String dropToAirport = "$baseUrl_2/drop_to_airport.php";


  static const String showcarlist = "$baseUrl=show_cars";
  static const String bookingHistory = "$baseUrl=booking_history";
  static const String cancel = "$baseUrl=cancel_order";
}
