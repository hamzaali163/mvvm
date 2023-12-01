import 'package:flutter/foundation.dart';
import 'package:mvvm/data/network/response/base_api_services.dart';
import 'package:mvvm/data/network/response/network_api_services.dart';
import 'package:mvvm/model/Movie_List_Model.dart';
import 'package:mvvm/repository/app_url.dart';

class HomeRepository {
  BaseApiResponse _apiservices = NetworkApiResponse();

  Future<MovieListModel> movielist() async {
    try {
      dynamic response = await _apiservices.getapiresponse(AppUrl.test);

      return response = MovieListModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        print(Error());
      }
      throw e;
    }
  }
}
