import '../constants.dart';
import 'dart:convert';
import 'package:movie_listing_app/model/api.dart';
import 'package:http/http.dart' as http;
class Api{
   static const _trendingUrl='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
   static const _topRatedUrl='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
   static const _nowPlayingUrl='https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';

   Future<List<Movie>> getTrendingMovies() async{
     final response=await http.get(Uri.parse(_trendingUrl));
     if(response.statusCode==200){
       final decodedData=json.decode(response.body)['results'] as List;
       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     }
     else{
       throw Exception('Error Thrown');
     }
   }
   //since model is same as trending movies we can use the Movie model again
   Future<List<Movie>> getTopRatedMovies() async{
     final response=await http.get(Uri.parse(_topRatedUrl));
     if(response.statusCode==200){
       final decodedData=json.decode(response.body)['results'] as List;
       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     }
     else{
       throw Exception('Error Thrown');
     }
   }
   Future<List<Movie>> getNowPlayingMovies() async{
     final response=await http.get(Uri.parse(_nowPlayingUrl));
     if(response.statusCode==200){
       final decodedData=json.decode(response.body)['results'] as List;
       return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     }
     else{
       throw Exception('Error Thrown');
     }
   }
}