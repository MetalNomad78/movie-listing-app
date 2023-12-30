import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_listing_app/pages/description.dart';

import '../constants.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          enlargeCenterPage: true,
          pageSnapping: true,
          viewportFraction: 0.55,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,

        ),
        itemBuilder:(context, itemIndex, pageViewIndex){
          return GestureDetector(
            onTap:(){ Navigator.push(context,
              MaterialPageRoute(builder: (context)
              {
              return DetailsScreen(snapshot.data![itemIndex]);
            },
              ),
            );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit:BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}