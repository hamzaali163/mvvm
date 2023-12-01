import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm/data/app_exception.dart';
import 'package:mvvm/data/network/response/base_api_services.dart';

class NetworkApiResponse extends BaseApiResponse {
  dynamic jsonresponse;

  @override
  Future getapiresponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonresponse = returnResponse(response);
    } on SocketException {
      throw {FetchDataException('No internet connection ')};
    }
    return jsonresponse;
  }

  @override
  Future postapiresponse(String url, dynamic data) async {
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      jsonresponse = onjsonresponse(response);
    } on SocketException {
      throw {FetchDataException('No internet connection ')};
    }
    return jsonresponse;
  }

  dynamic onjsonresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw InvalidDetails('Invalid request');
      case 403:
        throw InvalidDetails(
            'forbidden response to an unsuccessful login/registration attempt.');
      case 404:
        throw UnauthorizedException('Unauthorized request');

      case 500:
      default:
        throw FetchDataException(
            'error occured while communicating with server' +
                'error code:' +
                response.statusCode.toString());
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidDetails(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
