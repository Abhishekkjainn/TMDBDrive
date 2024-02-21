import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/MovieModel.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<MovieModel> favs = <MovieModel>[];

  void addFavourite(
      String MovieTitle,
      String MovieOverView,
      bool isAdult,
      String MovieBackDropPath,
      double MoviePopularity,
      String MoviePosterPath,
      String MovieReleaseDate,
      double MovieRating,
      int MovieId) {
    favs.add(MovieModel(
        MovieTitle: MovieTitle,
        MovieOverView: MovieOverView,
        isAdult: isAdult,
        MovieBackDropPath: MovieBackDropPath,
        MoviePopularity: MoviePopularity,
        MoviePosterPath: MoviePosterPath,
        MovieReleaseDate: MovieReleaseDate,
        MovieRating: MovieRating,
        MovieId: MovieId));

    update();
  }

  void RemoveFavourite(int index) {
    favs.removeAt(index);
    update();
  }
}
