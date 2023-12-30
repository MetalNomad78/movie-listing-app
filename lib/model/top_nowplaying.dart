import 'package:flutter/material.dart';
import 'package:movie_listing_app/constants.dart';
import 'package:movie_listing_app/pages/description.dart';

class TopPlaying extends StatelessWidget {
  const TopPlaying({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200,width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data!.length, //! says that no matter what it should have some data
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return DetailsScreen(snapshot.data![index]);
                  },
                  ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 300,
                    width: 150,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${snapshot.data![index].posterPath}', //! used for same reason so that some data should come
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
