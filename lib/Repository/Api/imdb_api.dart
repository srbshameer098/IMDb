import 'dart:convert';


import 'package:http/http.dart';


import '../ModelClass/ImdbModel.dart';
import 'api_client.dart';




class ImdbApi {
  ApiClient apiClient = ApiClient();


  Future<ImdbModel> getImdb() async {
    String trendingpath = 'https://imdb-top-100-movies.p.rapidapi.com/top32';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return ImdbModel.fromJson(jsonDecode(response.body));
  }

}