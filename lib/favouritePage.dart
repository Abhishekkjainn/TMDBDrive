import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/favouriteController.dart';
import 'package:flutter_application_1/movieDetails.dart';
import 'package:get/get.dart';

class FavouritesList extends StatelessWidget {
  const FavouritesList({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteController controller = Get.find();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      appBar: appBarFavourites(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<FavouriteController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.favs.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Dismissible(
                        key: ValueKey<int>(controller.favs[index].MovieId),
                        onDismissed: (direction) {
                          controller.RemoveFavourite(index);
                        },
                        background: Container(
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.delete_solid,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                                () => MovieDetails(
                                    movieDetails: controller.favs[index]),
                                transition: Transition.rightToLeft);
                          },
                          child: FavouriteTile(controller, index),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Container FavouriteTile(FavouriteController controller, int index) {
    return Container(
      height: 160,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Container(
              height: 140,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${controller.favs[index].MoviePosterPath}'))),
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 180,
                    height: 65,
                    child: Text(
                      controller.favs[index].MovieTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: Text(
                      controller.favs[index].MovieOverView,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 93, 93, 93),
                      ),
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

  AppBar appBarFavourites() {
    return AppBar(
      title: Text(
        'Favourites',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            CupertinoIcons.heart_circle_fill,
            color: Colors.redAccent,
            size: 32,
          ),
        )
      ],
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      leading: IconButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 28, 28, 28))),
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: 26,
          )),
    );
  }
}
