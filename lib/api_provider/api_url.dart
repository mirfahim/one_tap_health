class ApiUrl {
  String api_token = '';
  static String googleMapApiKey = '';
  static String baseUrl = 'https://oth.yunicarebd.com/api/v1/client';

  static String login = '$baseUrl/login';
  static String signup = '$baseUrl/register';
  static String homeApiList = '$baseUrl/contractor/home';
  static String browseJobList = '$baseUrl/search-results';
  static String getContactorList = '$baseUrl/search-results';

}