import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MainPage.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/model/MovieModel.dart';
import 'package:flutter_application_1/model/favouriteController.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    FavouriteController controller = Get.put(FavouriteController());
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      body: MainPage(),
    );
  }
}
