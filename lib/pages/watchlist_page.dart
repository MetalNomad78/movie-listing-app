import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/api.dart';
import 'package:movie_listing_app/model/movie_model.dart';
import 'package:movie_listing_app/model/watchlist_model.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatelessWidget {

  const WatchlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: Consumer<WatchListModel>(
        builder: (context,value,child){
        return GridView.builder(
          itemCount: value.movieItems.length,
      padding: EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index) {
            Movie movie = value.movieItems[index];
        return MovieTile(movie:movie);
        }
        );
        },
      ),
    );
  }
}
