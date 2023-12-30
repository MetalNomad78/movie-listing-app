import 'package:flutter/material.dart';
import 'package:movie_listing_app/constants.dart';
import 'package:movie_listing_app/model/api.dart';
import 'home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(this.movie, {Key? key}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 150,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   automaticallyImplyLeading: false,
      //   flexibleSpace: ClipPath(
      //     clipper: _CustomClipper(),
      //     child: Container(
      //       color: Colors.grey[900],
      //       child: Center(
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Image.asset(
      //             "lib/images/title.png",
      //             width: 250,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          ..._buildBackground(context,movie),
          Positioned(
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
                    movie.releaseDate,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),

                  ),
                  const SizedBox(height: 20),

                ],
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
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle navigation to the search screen
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Handle navigation to the favorites screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
List<Widget> _buildBackground(context,movie){
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

// class _CustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double height = size.height;
//     double width = size.width;
//
//     var path = Path();
//
//     path.lineTo(0, height - 50);
//     path.quadraticBezierTo(width / 2, height, width, height - 50);
//     path.lineTo(width, 0);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
