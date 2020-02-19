import 'dart:convert';
import 'package:flutter_mvvm/models/Movie.dart';
import 'package:http/http.dart' as http;

class MovieService {
  List<Movie> _movies = List<Movie>();
  String apiUrl;

  MovieService({this.apiUrl});

  Future<List<Movie>> getMovies(String keyword) async {
    final url = "$apiUrl?s=$keyword&apikey=67b8e2cf";
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      _movies = json.map((movie) => Movie.fromJson(movie)).toList();
      return _movies;
    } else {
//      throw Exception("Unable to get movies");
      final mock = new List<Movie>();
      mock.add(Movie(title:"No movies found", poster:"https://c1.staticflickr.com/1/563/22489529662_0489a3aff5_b.jpg"));

      return mock;
    }
  }

  Future<Movie> getMovieAtIndex(int index) async {
    final url = "http://www.omdbapi.com/?s=cars&apikey=67b8e2cf";
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      _movies = json.map((movie) => Movie.fromJson(movie)).toList();

      return _movies.elementAt(index);
    } else
      return null;
  }
}