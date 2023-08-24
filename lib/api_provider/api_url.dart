import 'package:one_tap_health/main.dart';

class ApiUrl {
  String api_token = '';
  static String googleMapApiKey = '';
  static String mainUrl = 'https://onetaphealth.com/api/v1';
  //static String baseUrl = 'https://oth.yunicarebd.com/api/v1/client';
  static String baseUrl = 'https://onetaphealth.com/api/v1/client';
  static String myProfile = '$baseUrl/my-profile';

  static String login = '$baseUrl/login';
  static String signup = '$baseUrl/register';
  static String testCatList = '$baseUrl/active-category-list';
  static String myTestOrder = '$baseUrl/test-order';
  static String myAppointmentOrderList = '$baseUrl/doctor-appointment';

  static String doctorByHospital = '$baseUrl/doctors-by-hospital/';

  static String callPayment = '$mainUrl/sslPay/pay';
  static String hospitalList = '$baseUrl/active-hospital-list';
  static String catWiseActiveTest = '$baseUrl/category-wise-active-test-list/';
  static String testHospital = '$baseUrl/cost-of-hospitals-test/'; // oth.yunicarebd.com/api/v1/client/cost-of-hospitals-test/3
  static String makeTestOrder = '$baseUrl/test-order';
  static String doctorList = '$baseUrl/active-doctors-list';
  static String makeAppointmentOrder = '$baseUrl/doctor-appointment';
  static String doctorSchedule = '$baseUrl/doctor-schedules/';

}