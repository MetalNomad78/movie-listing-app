import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 10,
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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 300,
                        width: 200,
                        color: const Color(0xffA4161A),
                      ),
                    );
                  },
                ),
              ),
                const SizedBox(height: 20),
              Text('Top Rated Movies',
                style:
                GoogleFonts.oswald(fontSize: 25,fontWeight: FontWeight.bold),

              ),
              const SizedBox(height: 20),
              SizedBox(height: 200,width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                         height: 200,
                        width: 150,
                        color: const Color(0xffA4161A),
                      ),
                    ),
                  );
                  }
              ),
              ),

              const SizedBox(height: 20),
              Text('Now Playing',
                style:
                GoogleFonts.oswald(fontSize: 25,fontWeight: FontWeight.bold),

              ),
              const SizedBox(height: 20),
              SizedBox(height: 200,width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 200,
                            width: 150,
                            color: Color(0xffA4161A),
                          ),
                        ),
                      );
                    }
                ),
              )


              // Add more content/widgets as needed
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
