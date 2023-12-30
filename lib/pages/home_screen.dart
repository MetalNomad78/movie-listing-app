import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_listing_app/api/api_call.dart';
import 'package:movie_listing_app/model/api.dart';
import 'package:movie_listing_app/model/trending_movies.dart';
import 'package:movie_listing_app/pages/watchlist_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> nowPlayingMovies;

  @override
  void initState(){
    super.initState();
    trendingMovies=Api().getTrendingMovies();
    topRatedMovies=Api().getTopRatedMovies();
    nowPlayingMovies=Api().getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _CustomClipper(),
          child: Container(
            color: Colors.grey[900],
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "lib/images/title.png",
                  width: 250,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WatchlistPage()),
          );
        },
        child: Icon(Icons.favorite, color: Colors.white), // Heart icon in white color
        backgroundColor: Colors.black, // Black background color
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Trending Movies',
              style:
                GoogleFonts.oswald(fontSize: 25,fontWeight: FontWeight.bold),

              ),
              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      //final data =snapshot.data;
                      return TrendingMovies(snapshot: snapshot,);
                    }else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text('Top Rated Movies',
                style:
                GoogleFonts.oswald(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      //final data =snapshot.data;
                      return TrendingMovies(snapshot: snapshot,);
                    }else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),
              Text('Now Playing',
                style:
                GoogleFonts.oswald(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                ),

              ),
              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else if(snapshot.hasData){
                      //final data =snapshot.data;
                      return TrendingMovies(snapshot: snapshot,);
                    }else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}



