import 'package:mvvm/data/network/response/base_api_services.dart';
import 'package:mvvm/data/network/response/network_api_services.dart';
import 'package:mvvm/repository/app_url.dart';

class AuthRepository {
  BaseApiResponse _getapiresponse = NetworkApiResponse();

  Future<dynamic> loginapi(dynamic data) async {
    try {
      dynamic response =
          await _getapiresponse.postapiresponse(AppUrl.loginendpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> Registerapi(dynamic data) async {
    dynamic response =
        await _getapiresponse.postapiresponse(AppUrl.signuppurl, data);

    try {
      return response;
    } catch (e) {
      throw e;
    }
  }
}
