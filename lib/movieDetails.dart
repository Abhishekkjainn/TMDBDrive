import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/MovieModel.dart';
import 'package:flutter_application_1/model/favouriteController.dart';
import 'package:get/get.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieDetails;
  MovieDetails({super.key, required this.movieDetails});
  FavouriteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      appBar: Appbardetails(controller: controller),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.1,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${movieDetails.MoviePosterPath}'))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 120, left: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movieDetails.MoviePosterPath}',
                            width: 140,
                          ),
                        ),
                        Expanded(
                          child: IntrinsicHeight(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movieDetails.MovieTitle,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      movieDetails.isAdult
                                          ? 'Adult Rated'
                                          : 'Suitable for kids',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                        'Rating - ${movieDetails.MovieRating.toStringAsFixed(1)} / 10',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                        'Release - ${movieDetails.MovieReleaseDate}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                        'Popularity - ${movieDetails.MoviePopularity}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Text(
                      movieDetails.MovieOverView,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 216, 216, 216),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar Appbardetails({required FavouriteController controller}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 30, 30, 30))),
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () {
              controller.addFavourite(
                  movieDetails.MovieTitle,
                  movieDetails.MovieOverView,
                  movieDetails.isAdult,
                  movieDetails.MovieBackDropPath,
                  movieDetails.MoviePopularity,
                  movieDetails.MoviePosterPath,
                  movieDetails.MovieReleaseDate,
                  movieDetails.MovieRating,
                  movieDetails.MovieId);
              print(controller.favs);
            },
            icon: Icon(
              CupertinoIcons.suit_heart,
              size: 26,
              color: Colors.redAccent,
            ))
      ],
    );
  }
}
