import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieSearchPage extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Film> _films = [];

  Future<void> searchFilms() async {
    final String apiKey = '67e95471c19918ad809025f7f761f2b4';
    final String query = _searchController.text.trim();

    if (query.isEmpty) {
      return;
    }

    final String apiUrl =
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print('API Response: $data');

      final List<dynamic> results = data['results'];

      setState(() {
        _films = results.map((result) => Film.fromJson(result)).toList();
      });
    } else {
      print('Failed to load data: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film Search App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a film...',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: searchFilms,
              child: Text('Search'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _films.length,
                itemBuilder: (context, index) {
                  final film = _films[index];
                  return FilmCard(film: film);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Film {
  final String title;
  final int year;
  final String posterPath;

  Film({required this.title, required this.year, required this.posterPath});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      year: json['release_date'] != null
          ? DateTime.parse(json['release_date']).year
          : 0,
      posterPath: json['poster_path'],
    );
  }
}

class FilmCard extends StatelessWidget {
  final Film film;

  FilmCard({required this.film});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: film.posterPath != null
            ? Image.network(
          'https://image.tmdb.org/t/p/w185/${film.posterPath}',
          width: 50,
          height: 75,
          fit: BoxFit.cover,
        )
            : Icon(Icons.movie),
        title: Text(film.title),
        subtitle: Text('${film.year}'),
      ),
    );
  }
}
