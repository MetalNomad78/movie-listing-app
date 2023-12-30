import 'package:flutter/material.dart';
import 'package:movie_listing_app/constants.dart';
import 'package:movie_listing_app/model/api.dart';

class MovieTile extends StatefulWidget {
  final Movie movie;


  MovieTile({
    super.key,
    required this.movie,

  });

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            Image.network(
              '${Constants.imagePath}${widget.movie.posterPath}',
              filterQuality: FilterQuality.high,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),

      ),
    );
  }
}