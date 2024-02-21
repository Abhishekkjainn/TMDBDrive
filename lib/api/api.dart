import 'dart:convert';

import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/model/MovieModel.dart';
import 'package:http/http.dart' as http;

class api {
  final PopularMoviesApiURL =
      'https://api.themoviedb.org/3/movie/popular?api_key=${APIKEY}';
  final TopRatedMoviesApiURL =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${APIKEY}';
  final UpcomingMoviesApiURL =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${APIKEY}';
  final NowShowingMoviesApiURL =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${APIKEY}';

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse(PopularMoviesApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<MovieModel> movies =
          data.map((movie) => MovieModel.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed To Load Popular Movies');
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(TopRatedMoviesApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<MovieModel> movies =
          data.map((movie) => MovieModel.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed To Load TopRated Movies');
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(UpcomingMoviesApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<MovieModel> movies =
          data.map((movie) => MovieModel.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed To Load Upcoming Movies Movies');
    }
  }

  Future<List<MovieModel>> getNowShowingMovies() async {
    final response = await http.get(Uri.parse(NowShowingMoviesApiURL));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      List<MovieModel> movies =
          data.map((movie) => MovieModel.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed To Load NowShowing Movies');
    }
  }
}
