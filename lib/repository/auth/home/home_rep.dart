import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:one_tap_health/api_provider/api_provider.dart';
import 'package:one_tap_health/api_provider/api_url.dart';
import 'package:one_tap_health/model/banner_model.dart';
import 'package:one_tap_health/service/auth_service.dart';


class HomeRepository {


  Future<BannerModel> getBanner() async {


    Uri url = Uri.parse("https://onetaphealth.com/api/v1/client/active-banner-list");
    final response = await http.get(
      url,
      headers: {

        'Authorization': "Bearer ${Get.find<AuthService>().apiToken}",
      },
    );

    print("my resposnse repo ${response.body}");
    Map data = jsonDecode(response.body);

    return BannerModel.fromJson(json.decode(response.body));
  }
}
