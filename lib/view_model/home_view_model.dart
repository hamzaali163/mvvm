import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/Movie_List_Model.dart';
import 'package:mvvm/repository/home_respository.dart';

class HomeViewMode with ChangeNotifier {
  final _myrepo = HomeRepository();

  ApiResponse<MovieListModel> movielist = ApiResponse.loading();

  setmovielist(ApiResponse<MovieListModel> response) {
    movielist = response;
    notifyListeners();
  }

  Future<void> returnmovielist() async {
    setmovielist(ApiResponse.loading());

    _myrepo.movielist().then((value) {
      setmovielist(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      print(error.toString());
      setmovielist(ApiResponse.error(error.toString()));
    });
  }
}
