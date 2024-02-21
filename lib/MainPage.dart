import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/favouritePage.dart';
import 'package:flutter_application_1/model/MovieModel.dart';
import 'package:flutter_application_1/movieDetails.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<MovieModel>> UpComingMovies;
  late Future<List<MovieModel>> PopularMovies;
  late Future<List<MovieModel>> NowShowingMovies;
  late Future<List<MovieModel>> TopRatedMovies;

  @override
  void initState() {
    PopularMovies = api().getPopularMovies();
    UpComingMovies = api().getUpcomingMovies();
    NowShowingMovies = api().getNowShowingMovies();
    TopRatedMovies = api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        appBar: AppBarMain(),
        drawer: Drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              nowShowingCarousel(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 30, bottom: 30),
                    child: Text(
                      'Popular Movies',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  PopularMoviesCarousel(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0, left: 30, bottom: 30),
                    child: Text(
                      'Top Rated Movies',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  TopRatedMoviesCarousel(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 0, left: 30, bottom: 30),
                    child: Text(
                      'Upcoming Movies',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  UpcomingMoviesCarousel(),
                ],
              ),
            ],
          ),
        ));
  }

  FutureBuilder<List<MovieModel>> UpcomingMoviesCarousel() {
    return FutureBuilder(
      future: UpComingMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final upMovie = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 30, right: 20),
          child: CarouselSlider.builder(
              itemCount: upMovie.length,
              itemBuilder: (context, index, popIndex) {
                return Padding(
                  padding: const EdgeInsets.only(right: 0, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => MovieDetails(movieDetails: upMovie[index]),
                          transition: Transition.rightToLeft);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${upMovie[index].MoviePosterPath}')),
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 47, 47, 47)),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                padEnds: false,
                // aspectRatio: 1.2,
                height: 300,
                // viewportFraction: 0.65,
                viewportFraction: 0.65,
                autoPlay: false,
                disableCenter: true,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: false,
              )),
        );
      },
    );
  }

  FutureBuilder<List<MovieModel>> TopRatedMoviesCarousel() {
    return FutureBuilder(
      future: TopRatedMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final topMovie = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 30, right: 20),
          child: CarouselSlider.builder(
              itemCount: topMovie.length,
              itemBuilder: (context, index, popIndex) {
                return Padding(
                  padding: const EdgeInsets.only(right: 0, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => MovieDetails(movieDetails: topMovie[index]),
                          transition: Transition.rightToLeft);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${topMovie[index].MoviePosterPath}')),
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 47, 47, 47)),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                padEnds: false,
                // aspectRatio: 1.2,
                height: 300,
                // viewportFraction: 0.65,
                viewportFraction: 0.65,
                autoPlay: false,
                disableCenter: true,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: false,
              )),
        );
      },
    );
  }

  FutureBuilder<List<MovieModel>> PopularMoviesCarousel() {
    return FutureBuilder(
      future: PopularMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final popMovie = snapshot.data!;
        return Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 30, right: 20),
          child: CarouselSlider.builder(
              itemCount: popMovie.length,
              itemBuilder: (context, index, popIndex) {
                return Padding(
                  padding: const EdgeInsets.only(right: 0, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => MovieDetails(movieDetails: popMovie[index]),
                          transition: Transition.rightToLeft);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${popMovie[index].MoviePosterPath}')),
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 47, 47, 47)),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                padEnds: false,
                // aspectRatio: 1.2,
                height: 300,
                // viewportFraction: 0.65,
                viewportFraction: 0.65,
                autoPlay: false,
                disableCenter: true,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: false,
              )),
        );
      },
    );
  }

  FutureBuilder<List<MovieModel>> nowShowingCarousel() {
    return FutureBuilder(
      future: NowShowingMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final nowShowing = snapshot.data!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, bottom: 20),
              child: Text(
                'Now Showing',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CarouselSlider.builder(
                  itemCount: nowShowing.length,
                  itemBuilder: (context, index, movieIndex) {
                    final nowShowingMovie = nowShowing[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                            () => MovieDetails(movieDetails: nowShowingMovie),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(0.8)
                              ]),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${nowShowingMovie.MovieBackDropPath}'),
                                  opacity: 0.4)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500${nowShowingMovie.MoviePosterPath}'))),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 130,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            nowShowingMovie.MovieTitle,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            nowShowingMovie.MovieOverView,
                                            style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 211, 211, 211),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                  options: CarouselOptions(
                      aspectRatio: 1.2,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(milliseconds: 8000),
                      pauseAutoPlayInFiniteScroll: true,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: 0.85)),
            ),
          ],
        );
      },
    );
  }

  AppBar AppBarMain() {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 187, 187, 187), size: 26),
      backgroundColor: Colors.transparent,
      title: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
                color: const Color.fromARGB(255, 187, 187, 187), width: 3)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 6, bottom: 6, left: 15, right: 15),
          child: Text(
            'TMDB',
            style: TextStyle(
                color: const Color.fromARGB(255, 197, 197, 197),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => FavouritesList(), transition: Transition.downToUp);
          },
          icon: Icon(
            CupertinoIcons.heart_circle_fill,
            color: const Color.fromARGB(255, 182, 182, 182),
            size: 32,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: IconButton(
              onPressed: () {
                Get.to(() => FavouritesList(), transition: Transition.upToDown);
              },
              icon: Icon(
                CupertinoIcons.search_circle_fill,
                color: const Color.fromARGB(255, 182, 182, 182),
                size: 32,
              )),
        ),
      ],
    );
  }
}
