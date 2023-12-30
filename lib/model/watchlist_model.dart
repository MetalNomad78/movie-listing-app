import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/api.dart';


class WatchListModel extends ChangeNotifier {
  final List<Movie> _watchlist = [];
  get movieItems=>_watchlist;
  void addItemToWatch(Movie movie){
    _watchlist.add(movie);
    notifyListeners();
  }
  void removeItemToWatch(Movie movie){
    _watchlist.remove(movie);
    notifyListeners();
  }

}

