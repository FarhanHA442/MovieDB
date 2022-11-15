import 'dart:convert';
import 'package:http/http.dart';
import 'package:minggu_10_moviedb/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '13e46f5e5736bfd93514cfe34af54882';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    // String url = '$baseUrl/movie/popular?api_key=$apiKey';
    // print(url);
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));


        if (response.statusCode == 200) {
          return PopularMovies.fromJson(jsonDecode(response.body));
        } else {
          throw Exception(response.statusCode);
        }
  }
}