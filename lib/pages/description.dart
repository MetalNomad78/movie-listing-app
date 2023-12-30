import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/watchlist_model.dart';
import 'package:movie_listing_app/pages/home_screen.dart';
import 'package:movie_listing_app/pages/movie_search_page.dart';
import 'package:movie_listing_app/pages/watchlist_page.dart';
import 'package:movie_listing_app/constants.dart';
import 'package:movie_listing_app/model/api.dart';
import 'package:provider/provider.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen(this.movie, {Key? key}) : super(key: key);
  final Movie movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool addedToWatchlist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackground(context, widget.movie),
          _buildMovieInformation(context, widget.movie),
          Positioned(
            bottom: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Consumer<WatchListModel>(
                  builder: (context, value, child) {
                    // Update addedToWatchlist based on whether the movie is in the watchlist
                    addedToWatchlist = value.movieItems.contains(widget.movie);

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: addedToWatchlist
                            ? Colors.green
                            : const Color(0xffff7272),
                        fixedSize: Size(MediaQuery
                            .of(context)
                            .size
                            .width * 0.5, 50),
                      ),
                      onPressed: () {
                        // Toggle watchlist status
                        if (addedToWatchlist) {
                          // Remove movie from watchlist
                          value.removeItemToWatch(widget.movie);
                        } else {
                          // Add movie to watchlist
                          value.addItemToWatch(widget.movie);
                        }
                      },
                      child: RichText(
                        text: TextSpan(
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                              text: addedToWatchlist ? 'Added to ' : 'Add to ',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: 'Watchlist'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()), // Navigate to WatchlistPage
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle navigation to the search screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieSearchPage()), // Navigate to WatchlistPage
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Handle navigation to the favorites screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WatchlistPage()), // Navigate to WatchlistPage
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context, movie) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${DateTime.parse(movie.releaseDate).year}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              movie.overview,
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(height: 1.75, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(BuildContext context, movie) {
    return [
      Container(
        height: double.infinity,
        color: Colors.white,
      ),
      Image.network(
        '${Constants.imagePath}${movie.backDropPath}',
        filterQuality: FilterQuality.high,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.5],
            ),
          ),
        ),
      ),
    ];
  }
}