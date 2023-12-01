abstract class BaseApiResponse {
  Future<dynamic> getapiresponse(String url);

  Future<dynamic> postapiresponse(String url, dynamic data);
}
