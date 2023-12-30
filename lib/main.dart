import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/watchlist_model.dart';
import 'package:movie_listing_app/pages/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>WatchListModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Movies Listing App',
        home: HomeScreen(),
      ),
    );
  }
}